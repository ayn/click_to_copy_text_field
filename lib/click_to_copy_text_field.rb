# ClickToCopyTextfield
module ClickToCopyTextfield
  
  def click_to_copy_text_field(object_name, method, options = {})
    click_to_copy(object_name, options) do
      text_field object_name, method, options
    end
  end
  
  def click_to_copy_text_field_tag(name, value = nil, options = {})
    click_to_copy(name, options) do
      text_field_tag name, value, options
    end
  end
  
  protected
  
  def click_to_copy(name, options, &block)
    fadeout_length = options.delete(:fadeout_length) || 600
    fadeout_timer = options.delete(:fadeout_timer) || 1000
    size = options[:size] || 30
    
    %Q{
      <style>
        .click_to_copy_copied{display:none;}
      </style>
      <span id="click_to_copy_input_#{name}" class="click_to_copy_text_field">
        #{capture(&block)}
      </span>
      <span id="click_to_copy_copied_#{name}" class="click_to_copy_copied">Copied to Clipboard</span>
      <script type="text/javascript">
        $.clipboardReady(function(){
          $('#click_to_copy_input_#{name} input##{name}').click(function(){
            $.clipboard($(this).val());
            $('#click_to_copy_copied_#{name}').fadeIn(#{fadeout_length});
            setTimeout("$('#click_to_copy_copied_#{name}').fadeOut(#{fadeout_length})", #{fadeout_timer});
            return false;
          });
        }, { swfpath: "/jquery.clipboard.swf", debug: false } );
      </script>
    }
  end
  
end