function build(type, id, elemClass, innerHTML, parent) {
  if (innerHTML == null) {
    innerHTML = ""
  }
  var string = "<" + type + " id=" + id + " class=" + elemClass + ">" + innerHTML + "</" + type + ">"
  $(parent).append(string)
}
