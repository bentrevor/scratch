function removeThirdPartyElements() {
  function R(w) {
    try {
      var d = w.document, j, i, tagName, T, oldDiv, newDiv, r = 1, C;

      for(j = 0; tagName = ["object","embed","applet","iframe"][j]; j++) {
        T = d.getElementsByTagName(tagName);

        for(i = T.length - 1; (i + 1) && (oldDiv = T[i]); --i) {
          if(j != 3 || !R((C = oldDiv.contentWindow) ? C : oldDiv.contentDocument.defaultView)) {
            newDiv = d.createElement("div");
            newDiv.style.width = oldDiv.width;
            newDiv.style.height = oldDiv.height;
            newDiv.innerHTML = "<del>" + (j == 3 ? "third-party " + tagName : tagName) + "</del>";

            oldDiv.parentNode.replaceChild(newDiv, oldDiv);
          }
        }
      }
    } catch(E) {
      r = 0;
    }
    return r;
  }

  R(self);
  var i, x;
  for(i = 0; x = frames[i]; i++) {
    R(x)
  }
} 

function useBlackTextOnWhiteBackground() {
  var styles = stringStylesheet();

  if(usingIE()) {
    createStyleSheetForIEWith(styles);
  } else {
    createStyleSheetForNonIEWith(styles);
  }
} 

function usingIE() {
  return document.createStyleSheet;
}

function createStyleSheetForIEWith(styles) {
  document.createStyleSheet("javascript:'" + styles + "'");
}

function createStyleSheetForNonIEWith(styles) {
  var newSS = document.createElement('link');
  newSS.rel = 'stylesheet';
  newSS.href = 'data:text/css,' + escape(styles);
  document.getElementsByTagName("head")[0].appendChild(newSS);
}

function stringStylesheet() {
  return "" +
    "* {"                                 + 
    "     background: white !important;"  +
    "     color:      black !important;"  +
    "     text-shadow: none !important;"  +
    "}"                                   +
    ""                                    +
    " :link, :link * {"                   + 
    "     color: #0000EE !important;"     +
    " }"                                  +
    ""                                    +
    ":visited, :visited * {"              +
    "     color: #551A8B !important;"     +
    "}";
}

javascript:(function(){var d=document; function K(N,w) { var nn = d.createElement(w), C = N.childNodes, i; for(i=C.length-1;i>=0;--i) nn.insertBefore(C[i],nn.childNodes[0]); N.parentNode.replaceChild(nn,N); } function Z(t,w) { var T = document.getElementsByTagName(t), j; for (j=T.length-1;j>=0;--j) K(T[j],w); } Z("blink", "span"); Z("marquee", "div"); })(); 

javascript:(function(){var H=["mouseover","mouseout","unload","resize"],o=window.opera; if(document.addEventListener/*MOZ*/&&!o) for(j in H)document.addEventListener(H[j],function(e){e.stopPropagation();},true); else if(window.captureEvents/*NS4*/&&!o) { document.captureEvents(-1/*ALL*/);for(j in H)window["on"+H[j]]=null;} else/*IE*/ {function R(N){var i,x;for(j in H)if(N["on"+H[j]]/*NOT TEXTNODE*/)N["on"+H[j]]=null;for(i=0;x=N.childNodes[i];++i)R(x);}R(document);}})(); 

javascript:(function() { var c, tID, iID; tID = setTimeout(function(){}, 0); for (c=1; c<1000 && c<=tID; ++c) clearTimeout(tID - c); iID = setInterval(function(){},1000); for (c=0; c<1000 && c<=iID; ++c) clearInterval(iID - c); })();

removeThirdPartyElements();
useBlackTextOnWhiteBackground();

console.log("got to the end");