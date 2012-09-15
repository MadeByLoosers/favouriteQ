(function(){

  /* FavouriteQuestion */
  $(document).ready(function(){

    // open all external links in new windows
    $('a[rel*=external]').on('click', openLink);

    // init collapsable areas
    $('.collapsable-trigger').on('click', toggleCollapsableArea);

    // add a character count to the
    countCharacters('#your-question');
  });



  // toggle collapsable area
  function toggleCollapsableArea(e) {

    var $trigger = $(this),
        areaName, areaHeight, $area;

    e.preventDefault();

    // find the area, from the selected trigger
    areaName = $trigger.attr('href');
    $area = $(areaName);
    areaHeight = $area.find('.collapsable-clip').outerHeight(true);

    // toggle height
    if ($area.height() === 0) {
      $area.height(areaHeight);
      $trigger.addClass('active');
    } else {
      $area.height(0);
      $trigger.removeClass('active');
    }

    // collapse any other collapsable areas
    $('.collapsable').not($area).height(0);
    $('.collapsable-trigger').not(this).removeClass('active');

    //console.log(areaHeight);
  }


  // open link in new window
  function openLink(e) {
    e.preventDefault();
    window.open(this.href);
  }


  // character count
  function countCharacters(el) {
    var interval,
        $el = $(el),
        $label = $el.parent().find('label'),
        counter = document.createElement('span'),
        limit = $el.attr("maxlength");

    $label.append(counter);

    $el.on('focus', function(e){
      interval = window.setInterval(countChars,100);
    });

    $el.on('blur', function(e){
      clearInterval(interval);
      countChars();
    });

    function countChars(){
      var length = $el.val().length || 0;
      counter.innerHTML = (limit-length)+" characters remaining";
    }
    countChars();
  }

})();