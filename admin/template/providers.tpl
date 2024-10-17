{combine_css path=$M365CONNECT_PATH|cat:'admin/template/style.css'}

{footer_script}
jQuery("select.enable").change(function() {
  var $top = $(this).closest("div.provider");
  var p = $top.data('p');
  
  if ($(this).val()=='true') {
    $top.find("td.keys").show();
    $top.removeClass('m365Disabled');
    $top.addClass('m365Enabled');
  }
  else {
    $top.find("td.keys").hide();
    $top.removeClass('m365Enabled');
    $top.addClass('m365Disabled');
  }
});
{/footer_script}


<div class="titrePage">
	<h2>Microsoft 365 Connect</h2>
</div>
<form method="post" action="" class="properties">
<fieldset id="commentsConf">

{foreach from=$PROVIDERS item=provider key=p}
  <div data-p="{$p}" class="provider {$p} {if isset($CONFIG[$p].enabled)}m365Enabled{else}m365Disabled{/if}">
    <h4>{$provider.name}</h4>
    
      <ol>
        <li>{'Go to <a href="%s" target="_blank">%s</a> > Azure Active Directory > App registrations > Create a tenant'|translate:$provider.new_app_link:$provider.new_app_link}</li>
        <li>{'Fill the name and redirect URI :  https://your_piwigo/plugins/m365connect/auth.php'|translate}</li>   
        <li>{'Get the Application (client) ID (= Application Key)'|translate}</li>     
        <li>{'In the tenant configuration, go to > Certificates & secrets. Create a new client secret. (= Application Secret)'|translate}</li>    
        <li>{'And in > Azure Active Directory > Properties, get the Tenant ID'|translate} 
        <li>{'Once you have registered, copy and past the created application credentials into this setup page'|translate}</li>     
      </ol>
   


    <table><tr>
     <td>
        <span class="m365connect_38px {$p|strtolower}"></span>
      </td>
      <td>
        <select name="providers[{$p}][enabled]" class="enable">
          <option value="true" {if isset($CONFIG[$p].enabled)}selected{/if}>{'Enabled'|translate}</option>
          <option value="false" {if !isset($CONFIG[$p].enabled)}selected{/if}>{'Disabled'|translate}</option>
        </select>
      
      </td>
      
      {if $provider.new_app_link}
      <td class="keys" {if !isset($CONFIG[$p].enabled)}style="display:none;"{/if}>       
          <label for="{$p}_key">{'Application Key'|translate}</label>
      <input type="text" id="{$p}_key" name="providers[{$p}][keys][key]" {if isset($CONFIG[$p].keys.key)}value="{$CONFIG[$p].keys.key}"{/if}>       
          <label for="{$p}_secret">{'Application Secret'|translate}</label>
      <input type="text" id="{$p}_secret" name="providers[{$p}][keys][secret]" {if isset($CONFIG[$p].keys.secret)}value="{$CONFIG[$p].keys.secret}"{/if}>
           <label for="{$p}_tenant">{'Tenant ID'|translate}</label>
      <input type="text" id="{$p}_tenant" name="providers[{$p}][keys][tenant]" {if isset($CONFIG[$p].keys.tenant)}value="{$CONFIG[$p].keys.tenant}"{/if}>
      </td>
      {/if}
    </tr></table>
    
  
  </div>
{/foreach}

</fieldset>

<p style="text-align:left;"><input type="submit" name="save_config" value="{'Save Settings'|translate}"></p>
  
</form>

<div style="text-align:right;">  
  Library : <a href="https://hybridauth.github.io" target="_blank">HybridAuth</a>
</div>