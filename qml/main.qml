import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: root
    height: 300
    width: 300
    visible: true
    x: Screen.width - width

    Material.theme: Material.Dark
    
    NumberAnimation on width {
        id: animation
        easing.type: Easing.InOutQuad
    }

    Button { 
        id: toogleButton
        anchors.centerIn: parent
        enabled: !animation.running
        text: width == 300 ? 'Size up' : 'Size down'
        onClicked: { 
            animation.from = width
            animation.to = width == 300 ? 600 : 300
            animation.start()
        }
    }
}