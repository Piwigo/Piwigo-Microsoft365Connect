{html_style}
#menubar DL#mbm365connect{
  float:right;
  margin-right:15px;
  display:flex;
  flex-direction:row;
}

#menubar DL#mbm365connect p{
  margin:3px;
}

#mbm365connect .nav-link{
  margin:0;
}

@media (max-width: 576px){
  .microsoftgraph{
    vertical-align: middle;
  }
  #mbm365connect .nav-link{
    padding: 0 1rem;
    display:inline-block;
  }
}

{/html_style}

{if 'bootstrap_darkroom' == $USER_THEME}
  <li class="nav-item" id="mbm365connect">
    <p class="nav-link">{'Sign in with'|translate}</p>
{else}
    <p>{'Or sign in with'|translate}</p>
{/if}

{foreach from=$M365CONNECT.providers item=provider key=p}{strip}
  {if $provider.enabled}
  <a href="#" class="m365connect {$p|strtolower}" data-idp="{$p}" title="{$provider.name}"></a>
  {/if}
{/strip}{/foreach}
{if 'bootstrap_darkroom' == $USER_THEME}
  </li>
{/if}