//
//  Palette.swift
//  EmojiArt
//
//  Created by Jakub Malinkiewicz on 20/12/2024.
//

import Foundation

struct Palette: Identifiable {
    var name: String
    var emojis: String
    
    let id = UUID()
    
    static let builtins = [
        Palette(name: "Vehicles", emojis: "🚗🚕🚙🚌🚎🏎️🚓🚑🚒🚐🛻🚜🚲🛴🏍️🛵✈️🚀🚁⛵️🚤🛥️🚢🚂🚃🚄🚆🚇🚝🚟🚠"),
        Palette(name: "Animals", emojis: "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸🐵🐔🐧🐦🐤🐣🦆🦅🦉🦇🐺🐗🐴🦄🐝🪲🐜🐞🦋🐌🐢🐍🦎🐙🦑🦀🦞🦐🦭🐬🐳🐋🐊"),
        Palette(name: "Food", emojis: "🍎🍊🍌🍉🍇🍓🍒🍑🥝🥥🍅🌽🥕🥦🥬🥒🥔🍠🌰🍞🥖🥐🥨🥯🧀🥚🍳🥞🧇🥓🥩🍗🍖🌭🍔🍟🍕🥪🌮🌯🥗🥘🍝🍣🍤🍜🥟🍦🍩🍪🎂🍰🧁🍫🍬🍭"),
        Palette(name: "Sports", emojis: "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥊🥋🎽⛳️🪁🏹🎯🛷⛷️🏂🏋️‍♀️🏋️‍♂️🤼‍♀️🤼‍♂️🤸‍♀️🤸‍♂️🏌️‍♀️🏌️‍♂️🤾‍♀️🤾‍♂️🏄‍♀️🏄‍♂️🏊‍♀️🏊‍♂️🤽‍♀️🤽‍♂️🚴‍♀️🚴‍♂️🚵‍♀️🚵‍♂️"),
        Palette(name: "Weather", emojis: "☀️🌤️⛅️🌥️🌦️🌧️⛈️🌩️❄️🌨️💨☔️🌈🌪️🌫️☃️⛄️🔥🌡️💦💧☄️"),
        Palette(name: "Travel", emojis: "✈️🛫🛬🚂🚃🚄🚅🚆🚇🚉🚊🚞🚟🚠🚡🛳️⛴️🚢🚤⛵️🛶🏕️🏖️🏝️🏜️🏞️🗻⛺️🛋️🛌🗿🗽🗼🏰🏯"),
        Palette(name: "Faces", emojis: "😀😃😄😁😆😅😂🤣😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🤩🥳😏😒😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤬🤯😳🥵🥶😱😨😰😥😓🤗🤔"),
        Palette(name: "Nature", emojis: "🌲🌳🌴🌵🌾🌿☘️🍀🎍🎋🍂🍁🌷🌸🌹🌻🌼🌺🌱🌵🌴🌳🌲🍃🍄🐚💐🌑🌒🌓🌔🌕🌖🌗🌘🌙🌚🌛🌜☀️⭐️🌟✨⚡️🌈🌬️"),
        Palette(name: "Music", emojis: "🎵🎶🎼🎹🎻🎺🎷🥁🎤🎧📯🎸🎙️📻🪕"),
        Palette(name: "Technology", emojis: "💻🖥️🖱️⌨️📱📲💾📀💿🖨️📡📞☎️📺🕹️🖌️🔧🔩⚙️🔋🔌💡🔦🧯🪫🔭📡"),
        Palette(name: "Clothing", emojis: "👕👖👗👘👙👚👛👜👝🎒👞👟👠👡👢🧢🎩🎓🪖⛑️👑💍👓🕶️🥽🧣🧤🧥🧦🧢🥿"),
        Palette(name: "Fantasy", emojis: "🧙‍♂️🧙‍♀️🧚‍♂️🧚‍♀️🧛‍♂️🧛‍♀️🧝‍♂️🧝‍♀️🧞‍♂️🧞‍♀️🧟‍♂️🧟‍♀️🦄🐉🐲🦹‍♂️🦹‍♀️🪄🔮✨🧌🌌"),
        Palette(name: "Flags", emojis: "🇺🇸🇬🇧🇨🇦🇦🇺🇮🇳🇯🇵🇫🇷🇩🇪🇮🇹🇧🇷🇷🇺🇨🇳🇰🇷🇪🇸🇲🇽🇿🇦🇳🇬🇸🇬🇵🇭🇹🇭🇻🇳🇦🇷")
    ]
}
