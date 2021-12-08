import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: root
    height: 300
    width: 300
    visible: true
    flags: Qt.FramelessWindowHint

    Component.onCompleted: {
        x = Screen.width - width;
        y = 0;
    }

    Material.theme: Material.Dark

    ParallelAnimation {
        id: animation

        NumberAnimation {
            id: widthAnimation
            target: root
            property: "width"
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            id: xAnimation
            target: root
            property: "x"
            easing.type: Easing.InOutQuad
        }
    }

    property bool lowerSize: true

    Rectangle {
        anchors.fill: parent
        
        Button { 
            anchors.centerIn: parent
            
            enabled: !animation.running
            text: lowerSize ? 'Size up' : 'Size down'
            onClicked: { 
                widthAnimation.from = lowerSize ? 300 : 600
                widthAnimation.to = lowerSize ? 600 : 300

                xAnimation.from = lowerSize ? Screen.width - 300 : Screen.width - 600
                xAnimation.to = lowerSize ? Screen.width - 600 : Screen.width - 300

                animation.start()
                lowerSize = !lowerSize
            }
        }
    }
}
