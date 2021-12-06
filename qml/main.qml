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
    x: Screen.width - width

    Material.theme: Material.Dark
    
    NumberAnimation on width {
        id: animation
        easing.type: Easing.InOutQuad
    }

    property var lowerSize: true

    Rectangle {
        anchors.fill: parent
        
        Button { 
            anchors.centerIn: parent
            
            enabled: !animation.running
            text: lowerSize ? 'Size up' : 'Size down'
            onClicked: { 
                animation.from = lowerSize ? 300 : 600
                animation.to = lowerSize ? 600 : 300
                animation.start()
                lowerSize = !lowerSize
            }
        }
    }
}