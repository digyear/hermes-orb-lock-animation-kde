// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia
import org.kde.kirigami 2.20 as Kirigami

ColumnLayout {
    id: root

    property var parentLayout

    spacing: Kirigami.Units.largeSpacing

    Label {
        Layout.fillWidth: true
        text: qsTr("Live preview")
        font.bold: true
    }

    Rectangle {
        id: preview
        Layout.fillWidth: true
        Layout.preferredHeight: Math.min(460, Math.max(260, width * 9 / 16))
        color: "#0700fe"
        radius: Kirigami.Units.smallSpacing
        clip: true

        MediaPlayer {
            id: previewPlayer
            source: Qt.resolvedUrl("../assets/hermes-orb.webm")
            videoOutput: previewOutput
            loops: MediaPlayer.Infinite
            Component.onCompleted: play()
        }

        VideoOutput {
            id: previewOutput
            anchors.centerIn: parent
            fillMode: VideoOutput.PreserveAspectFit
            width: Math.min(parent.width * 0.92, parent.height * 0.94 * 1284 / 1590)
            height: width * 1590 / 1284
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: previewCaption.implicitHeight + Kirigami.Units.largeSpacing
            color: "#99000000"

            Label {
                id: previewCaption
                anchors.centerIn: parent
                text: qsTr("Hermes Orb Animation · 15 FPS · 2.8-second loop")
                color: "white"
            }
        }
    }

    Label {
        Layout.fillWidth: true
        text: qsTr("This animation is ready to use. There are no additional settings.")
        wrapMode: Text.WordWrap
        opacity: 0.8
    }

    Item {
        Layout.fillHeight: true
    }
}
