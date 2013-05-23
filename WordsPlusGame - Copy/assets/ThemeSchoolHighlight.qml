import bb.cascades 1.0

//highlight only for school theme

Container {
    ImageView {
        id: highlightWords
        //imageSource: "theme/" + "school" + "/highlight_list.png"
        imageSource: {
            if (wordsPlus.theme == "school") {
                "theme/" + wordsPlus.theme + "/highlight_list.png"
            } else {
                ""
            }
        }
    }
}
