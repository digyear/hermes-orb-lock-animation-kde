// SPDX-License-Identifier: GPL-3.0-or-later
// Plasma adaptation copyright (C) 2026 digyear

import QtQuick 2.15
import QtMultimedia
import org.kde.plasma.plasmoid 2.0

WallpaperItem {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#0700fe"

        MediaPlayer {
            id: player
            source: Qt.resolvedUrl("../assets/hermes-orb.webm")
            videoOutput: orb
            loops: MediaPlayer.Infinite

            Component.onCompleted: play()
        }

        VideoOutput {
            id: orb
            anchors.centerIn: parent
            fillMode: VideoOutput.PreserveAspectFit
            width: Math.min(parent.width * 0.94, parent.height * 0.96 * 1284 / 1590)
            height: width * 1590 / 1284
        }
    }

    onVisibleChanged: {
        if (visible) {
            player.play()
        } else {
            player.pause()
        }
    }
}
