
  // curry pre < code to be able to get prettified
  // If the first line is
  //   #!-langname\n
  // Then that line is removed from the code and "langname" is given to prettify.
  // If "langname" is "none", that prettify is not applied at all.
  var n,i,L,cn,lang,v = document.getElementsByTagName('pre');
  var m,lang_re = /^#\!-([a-zA-Z0-9_-]+)\n/;
  for (i=0,L=v.length;i<L;++i) {
    n = v.item(i);
    if ((cn = n.firstChild) && cn.nodeName == 'CODE') {
      lang = null;
      if (cn.firstChild.nodeType === Node.TEXT_NODE) {
        m = lang_re.exec(cn.firstChild.nodeValue);
        if (m) {
          lang = m[1].toLowerCase();
          cn.firstChild.nodeValue = cn.firstChild.nodeValue.substr(m[0].length);
          if (lang === 'none') {
            continue;
          }
        }
      }
      n.setAttribute('class', 'prettyprint'+(lang ? ' lang-' + lang : ''));
    }
  }