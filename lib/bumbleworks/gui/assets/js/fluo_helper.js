FluoHelper = {
  drawAllSets: function(fluoSets) {
    var setsToDraw = fluoSets;
    if(typeof(Fluos) != 'undefined' && setsToDraw == null) {
      setsToDraw = Fluos;
    }
    if(setsToDraw) {
      $.each(setsToDraw, FluoHelper.drawSet);
    }
  },
  drawTree: function(divName, tree) {
    RuoteFluo.render(
      '#' + divName,
      tree,
      { noOuterBorder: true });
  },
  drawSet: function(divName, set) {
    FluoHelper.drawTree(divName, set.tree);
    if(typeof(set.pins) != 'undefined') {
      $.each(set.pins, FluoHelper.drawPin);
    }
  },
  drawPin: function(divName, pin) {
    RuoteFluo.pin(
      '#' + divName,
      pin.expid,
      pin.type,
      pin.label);
  }
}