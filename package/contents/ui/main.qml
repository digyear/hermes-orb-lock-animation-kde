// SPDX-License-Identifier: GPL-3.0-or-later
// Plasma adaptation copyright (C) 2026 digyear

import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0

WallpaperItem {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#0700fe"

        AnimatedImage {
            anchors.centerIn: parent
            source: Qt.resolvedUrl("../assets/hermes-orb.gif")
            playing: root.visible
            cache: false
            smooth: true
            fillMode: Image.PreserveAspectFit
            width: Math.min(parent.width * 0.94, parent.height * 0.96 * 1284 / 1590)
            height: width * 1590 / 1284
        }
    }
}
