<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="main.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        {literal}
            <script>
                $( document ).ready(function() {
                    
                    function copyfieldvalue(e, id){
                        var field = document.getElementById(id);
                        field.focus();
                        field.setSelectionRange(0, field.value.length);
                        var copysuccess = copySelectionText();
                        if (copysuccess){
                            showtooltip(e);
                        }
                    }
                });
            </script>
            
        {/literal}
    </head>
    <body>
    <pre>
        --------------------------------------
        Debug info
        {$debug_info}
        --------------------------------------
    </pre>
    <h1>  </h1>
        <div>

            <form name="f{$line}" id="mainForm" method="POST" enctype="multipart/form-data" action="">{* need html spec characters *}
                <input name="submit" type="submit" value="Submit"><br /><br />
                {foreach $drafts_array as $line => $value}
                    <div class="input_div">
                        <textarea id="copy{$line}" class="input_boxes" name="{$line}">{$value}</textarea>
                        <a onClick="copyfieldvalue(event, 'copy{$line}');return false" href="#" class="copytext">Copy</a>
                        <p class="cleartext">Clear</p>
                        <p class="charstext">{$chars[$line]}</p>
                    </div>
                {/foreach}
               
            </form> 
        </div>
    </body>
</html>