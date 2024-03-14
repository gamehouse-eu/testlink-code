{*
TestLink Open Source Project - http://testlink.sourceforge.net/
@uses tctitle.inc.tpl
@used-by tcView_viewer.tpl
*}

{* variable $tco will be available in included templates *}
{$tco = $inc_tcbody_testcase}

{include file="tctitle.inc.tpl"}
<!-- ------------------------------------------- -->

{if $inc_tcbody_cf.after_title neq ''}
  <div style="padding: 5px 3px 4px 5px;">
    <div id="cf_after_title" style="padding: 5px 3px 4px 5px;"
         class="custom_field_container">
      {$inc_tcbody_cf.after_title}
    </div>
  </div>
{/if}

{* ------------------------------------------------------------------------------------------ *}
{$showSummary = 0}
{if $tco.summary != '' || ($tco.summary == '' && $gui->hideSummary == FALSE)}
  {$showSummary = 1}
{/if}

{$showPreconditions = 0}
{if $tco.preconditions != '' || ($tco.preconditions == '' && $gui->hidePreconditions == FALSE)}
  {$showPreconditions = 1}
{/if}
{* ------------------------------------------------------------------------------------------ *}


<div class="mainAttrContainer">
  <div class="summaryCONTAINER">
    {if $inc_tcbody_cf.before_summary neq ''}
      <div id="cf_before_summary"
            class="custom_field_container">
        {$inc_tcbody_cf.before_summary}
      </div>
      <br>
    {/if}
    {if $showSummary}
      <fieldset class="x-fieldset x-form-label-left">
			  <legend class="legend_container">{$inc_tcbody_labels.summary}</legend>
			  <div id="summary" style="font-size: 90%">{if $inc_tcbody_editor_type == 'none'}{$tco.summary|nl2br}{else}{$tco.summary}{/if}</div>
			</fieldset>
    {/if}
    {if $inc_tcbody_cf.after_summary neq ''}
      <br>
      <div id="cf_after_summary"
            class="custom_field_container">
        {$inc_tcbody_cf.after_summary}
      </div>
    {/if}
  </div>

  <div class="preconditionsCONTAINER">
    {if $inc_tcbody_cf.before_preconditions neq ''}
      <div id="cf_before_preconditions"
            class="custom_field_container">
        {$inc_tcbody_cf.before_preconditions}
      </div>
      <br>
    {/if}
    {if $showPreconditions}
      <fieldset class="x-fieldset x-form-label-left">
			  <legend class="legend_container">
          {$inc_tcbody_labels.preconditions}
          {if $tco.ghost_preconditions != ''}
          <img class="clickable" src="{$tlImages.ghost_item}"
             title="{$inc_tcbody_labels.show_ghost_string}"
             onclick="showHideByDataEntity('preconditions_{$tco.id}');">
          <span id="preconditions_{$tco.id}" data-entity="preconditions_{$tco.id}" class="ghost" style="display:none">
            {$tco.ghost_preconditions}
          </span>
          {/if}
        </legend>
			  <div style="font-size: 90%">{if $inc_tcbody_editor_type == 'none'}{$tco.preconditions|nl2br}{else}{$tco.preconditions}{/if}</div>
			</fieldset>
    {/if}
    {if $inc_tcbody_cf.after_summary neq ''}
      <br>
      <div id="cf_after_preconditions"
            class="custom_field_container">
        {$inc_tcbody_cf.after_preconditions}
      </div>
    {/if}
  </div>

  {if $inc_tcbody_cf.before_steps_results neq ''}
    <div class="CFBeforeStepsCONTAINER">
      <div class="custom_field_container">
        {$inc_tcbody_cf.before_steps_results}
      </div>
    </div>
  {/if}
</div>
