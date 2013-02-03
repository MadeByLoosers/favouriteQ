(function(){

  /* FavouriteQuestion */
  $(document).ready(function(){

    // open all external links in new windows
    $('a[rel*=external]').on('click', openLink);

    // init collapsable areas
    $('.collapsable-trigger').on('click', toggleCollapsableArea);

    // add a character count to the
    countCharacters('#id_question');

    // submit questions via ajax
    $('#suggest-form').on('submit', submitQuestionAjax);

    // check whether we have deep-linked to a section
    checkDeeplink();
    $(window).bind('hashchange', checkDeeplink);
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


  // intercept question submit, and submit instead via ajax
  function submitQuestionAjax(e){
    e.preventDefault();

    var $status = $("#status"),
        $loadingImage = $status.find("img"),
        $loadingMessage = $status.find("p"),
        $form = $(e.target),
        status, img;

    // set loaing state
    $loadingImage.attr({ src:"/static/questions/img/loading.gif" });
    $loadingMessage.html("Submitting question...");

    // fade in loading message
    $status
      .css({opacity:0})
      .animate({opacity:1}, 500, function() {

      // post form
      var formData = $form.serialize();
      $.post("/ajax_suggest", formData, function(data, textStatus, jqXHR) {

        // process result
        if (data === "success") {
          status = "Your question has been added! Why not add another?";
          img = "/static/questions/img/tick.gif";
        } else {
          console.log(data, textStatus);
          status = "Sorry, there was an error submitting your question, please try again...";
          img = "/static/questions/img/cross.gif";
        }

        // display result and remove status
        $loadingImage.fadeOut(250);
        $loadingMessage.fadeOut(250, function(){
          $loadingMessage.html(status).fadeIn(250);
          $loadingImage.attr({src:img}).fadeIn(250);
        });
        $status.delay(3000).animate({opacity:0}, 250);

        // reset form
        $form.find("#id_question").val("");
        //$form.find("#id_twitter_user").val("");
      });
    });
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


  // check for deeplinks
  function checkDeeplink() {

    // check for hash
    var hash = window.location.hash;
    if (!!hash && hash.length > 0) {

      // hash is found, is it a link to a collapsable area?
      var linkTrigger = $("header nav a[href="+hash+"]");

      // link found, click it (to open the panel)
      if (linkTrigger.length > 0) {
        linkTrigger.click();
      }
    }
  }

})();