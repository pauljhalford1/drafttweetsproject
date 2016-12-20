<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Draft tweets</title>
        <link rel="stylesheet" type="text/css" href="main.css">
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.js"></script>
<script>
window.addEventListener("load", function(){
window.cookieconsent.initialise({
  "palette": {
    "popup": {
      "background": "#000"
    },
    "button": {
      "background": "#f1d600"
    }
  }
})});
</script>
        
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.js"></script>
        
            <script>
                
                $( document ).ready(function() {
                 
                    
                });
            </script>
           
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.css" />
<!--<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.js"></script>-->
<script>
    window.addEventListener("load", function(){
    window.cookieconsent.initialise({
      "palette": {
        "popup": {
          "background": "#000"
        },
        "button": {
          "background": "#f1d600"
        }
      },
      "content": {
        "message": "This website uses cookies."
      }
    })});
</script>
    </head>
    <body>
    
    <h1>Draft tweets</h1>
    <h2>A simple way of preparing tweets to send later</h2>
        <div style="align: center;">

            <form name="main_form" id="main_form" method="POST" enctype="multipart/form-data" action="">
                <div id="topbox">
                    
                    <input style="text-align: center; display: none;" id="submitbox" name="subm" type="submit" value="Save tweet">
                    
                   
                    
                    
                </div>
                {foreach $drafts_array as $line => $value}
                    <div class="input_div">
                        <textarea onblur="forceSubmit();" onkeyup="countChar(this)" id="copy{$line}" class="input_boxes" name="{$line}">{$value}</textarea>
                        <div style="width: 300px;">
                            <div style="float: left; width: 15px;">&nbsp;</div>
                            <div style="float: left; width: 90px;"><button type="button" onClick="copyfieldvalue(event, 'copy{$line}'); return false" href="#" class="copytext">Copy</button></div>
                            <div style="float: left; width: 90px; text-align: center;"><button type="button" onClick="eraseText('copy{$line}'); return false;" href="#">Clear</button></div>
                            <div style="float: left; width: 90px; text-align: right;"><span class="bottomtext" id="{$line}">{$chars[$line]}</span></div></div>
                            <div style="float: left; width: 15px;"></div>
                            <br style="clear: left;" />
                            <br />
                    
         
                        
                            <!--<p class="bottomtext">{$chars[$line]}</p>-->
                            <div>
                                <a href="https://twitter.com/intent/tweet?url=/'" class="twitter-share-button" data-text="{$value}" data-show-count="false">Tweet</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
                               
                                
                                
                              
                            </div>
                       
                    </div>
                {/foreach}
               
            </form> 
        </div>
    <!--
    <pre>
        --------------------------------------
        Debug info
       {$debug_info} 
        --------------------------------------
    </pre>
    -->
    </body>
</html>
<script>

    
function copyfieldvalue(e, id){
    
    var field = document.getElementById(id);
    field.focus();
    field.setSelectionRange(0, field.value.length);
    var copysuccess = copySelectionText();
    if (copysuccess){
        showtooltip(e);
    }
}
function copySelectionText(){
    var copysuccess // var to check whether execCommand successfully executed
    try{
        copysuccess = document.execCommand("copy") // run command to copy selected text to clipboard
    } catch(e){
        copysuccess = false
    }
    return copysuccess
}

$('#submitbox').hide();

function countChar(val) {
    
    var len = 140-(val.value.length);
    $('#text-character').text(len);
    
    
    //alert(val);
    var button=val.id.substr(4);
    // make red if minus
    if (len<0){
       $("body").find('#'+button).css('color', 'red');        
    } else {
       $("body").find('#'+button).css('color', 'black');    
    }
    
    
    //put in save box
    //get coords of inputbox
    var lefty=val.offsetLeft+100;
    var topy=val.offsetTop-20;
    
    //alert('d');
    $('#submitbox').css('left', lefty);
    $('#submitbox').css('top', topy);
    $('#submitbox').css('position', 'absolute');
    $('#submitbox').show();
    
    $("body").find('#'+button).text(len);
}

function eraseText(data){
    document.getElementById(data).value = "";
    //alert(data);
    var button=data.substr(4);
    $("body").find('#'+button).text(140);
}

function forceSubmit(){
    $('#main_form').submit();
}



//twitter code

                window.twttr = (function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0],
                    t = window.twttr || {};
                  if (d.getElementById(id)) return t;
                  js = d.createElement(s);
                  js.id = id;
                  js.src = "https://platform.twitter.com/widgets.js";
                  fjs.parentNode.insertBefore(js, fjs);

                  t._e = [];
                  t.ready = function(f) {
                    t._e.push(f);
                  };

                  return t;
                }(document, "script", "twitter-wjs"));
      


</script>