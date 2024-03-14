{*
TestLink Open Source Project - http://testlink.sourceforge.net/
@used-by inc_tcbody.tpl
*}
{$whoaim=$smarty.template|basename|replace:".inc.tpl":""}
<div class="container-fluid" id="{$whoaim}" style="margin-top: 3px;">
  <div class="row simple" id="title-and-icons">
      {* $tcversion_id inherited from tcView_viewer.tpl *}
      {if $inc_relations != ''}
        <img class="clickable" src="{$tlImages.relations}"
             title="{$inc_tcbody_labels.tc_has_relations}"
             onclick="document.getElementById('relations_{$tcversion_id}').scrollIntoView();">
      {/if}

      {$tco.tc_external_id}{$smarty.const.TITLE_SEP}{$tco.name|escape}
      {$smarty.const.TITLE_SEP_TYPE2}{$inc_tcbody_labels.version|escape}{$tco.version}
      {if $tco.ghost != ''}
      <img class="clickable" src="{$tlImages.ghost_item}"
               title="{$inc_tcbody_labels.show_ghost_string}"
               onclick="showHideByDataEntity('ghostTC');">
      <span style="display:none;" data-entity="ghostTC">{$tco.ghost}</span>
      {/if}

      <img class="clickable" src="{$tlImages.activity}"
           title="{$inc_tcbody_labels.display_author_updater}"
           onclick="showHideByDataEntity('createUpdate');">
  </div>
  {if $inc_tcbody_author_userinfo != ''}
    <div class="row time_stamp_creation" style="display:none;" data-entity="createUpdate">
      <fieldset class="groupBtn">
        {$inc_tcbody_labels.title_created}&nbsp;{localize_timestamp ts=$tco.creation_ts}&nbsp;
        {$inc_tcbody_labels.by}&nbsp;{$inc_tcbody_author_userinfo->getDisplayName()|escape}
      </fieldset>
    </div>
  {/if}

  {if $tco.updater_id != ''}
    <div class="row time_stamp_creation" style="display:none;" data-entity="createUpdate">
      <fieldset class="groupBtn">
        {$inc_tcbody_labels.title_last_mod}&nbsp;{localize_timestamp ts=$tco.modification_ts}
        &nbsp;{$inc_tcbody_labels.by}&nbsp;{$inc_tcbody_updater_userinfo->getDisplayName()|escape}
      </fieldset>
    </div>
  {/if}
</div>
