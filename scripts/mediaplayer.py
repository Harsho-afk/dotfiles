#!/usr/bin/env python3
import gi

gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
import argparse
import sys
import signal
import json


class PlayerManager:
    def __init__(self, selected_player):
        self.selected_player = selected_player
        self.manager = Playerctl.PlayerManager()
        self.loop = GLib.MainLoop()

        self.manager.connect("name-appeared", lambda _, p: self.on_player_appeared(p))
        self.manager.connect("player-vanished", lambda _, p: self.on_player_vanished(p))

        signal.signal(signal.SIGINT, self.quit)
        signal.signal(signal.SIGTERM, self.quit)
        signal.signal(signal.SIGPIPE, signal.SIG_DFL)

        for name in self.manager.props.player_names:
            if name.name == self.selected_player:
                self.init_player(name)

    def quit(self, *_):
        sys.stdout.write("\n")
        sys.stdout.flush()
        sys.exit(0)

    def run(self):
        self.loop.run()

    def init_player(self, name):
        player = Playerctl.Player.new_from_name(name)
        player.connect("playback-status", lambda p, *_: self.on_metadata_changed(p))
        player.connect("metadata", lambda p, *_: self.on_metadata_changed(p))
        self.manager.manage_player(player)
        self.on_metadata_changed(player)

    def write_output(self, text, player):
        output = {
            "text": text,
            "class": "custom-" + player.props.player_name,
            "alt": player.props.player_name,
        }
        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    def clear_output(self):
        sys.stdout.write("\n")
        sys.stdout.flush()

    def on_metadata_changed(self, player):
        title = player.get_title()
        if not title:
            self.clear_output()
            return

        title = title.replace("&", "&amp;")

        metadata = player.props.metadata
        if "mpris:trackid" in metadata.keys() and ":ad:" in metadata["mpris:trackid"]:
            title = "Advertisement"

        icon = " " if player.props.status == "Playing" else " "
        self.write_output(icon + title, player)

    def on_player_appeared(self, name):
        if name.name == self.selected_player:
            self.init_player(name)

    def on_player_vanished(self, _):
        self.clear_output()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--player", required=True)
    args = parser.parse_args()

    PlayerManager(args.player).run()


if __name__ == "__main__":
    main()
