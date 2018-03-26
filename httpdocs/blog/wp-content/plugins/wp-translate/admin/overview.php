<?php
if(preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF'])) { die('You are not allowed to call this page directly.'); }

	if (isset($_POST["editOptions"])) {
		if(check_admin_referer('wp_translate','wp_translate')) {
			$wpTranslateOptions['default_language'] = sanitize_text_field($_POST["defaultLanguage"]);
			if (isset($_POST["trackingEnabled"]))
				$wpTranslateOptions['tracking_enabled'] = true;
			else
				$wpTranslateOptions['tracking_enabled'] = false;
			
			$wpTranslateOptions['tracking_id'] = sanitize_text_field($_POST["trackingId"]);
			
			if (isset($_POST["autoDisplay"]))
				$wpTranslateOptions['auto_display'] = true;
			else
				$wpTranslateOptions['auto_display'] = false;
				
			if (isset($_POST["excludeMobile"]))
				$wpTranslateOptions['exclude_mobile'] = true;
			else
				$wpTranslateOptions['exclude_mobile'] = false;
				
			update_option("wpTranslateOptions", $wpTranslateOptions);
			?>  
			<div class="updated"><p><strong><?php _e('WP Translate settings have been saved.', 'wp-translate' ); ?></strong></p></div>  
			<?php
		}
	}
	$wpTranslateOptions = get_option("wpTranslateOptions");
?>
<div id='wrap'>
	<h2><?php _e('WP Translate', 'wptranslate'); ?></h2>
	<p>You can also use the <a href="<?php echo get_site_url().'/wp-admin/widgets.php'; ?>">WP Translate Widget</a> that will insert a drop down list of languages instead of the default tool bar.</p>
	<h2><?php _e('WP Translate - Settings', 'wp-translate'); ?></h2>    
    <h3 style="float: left; width 50%;"><?php _e('Default Language', 'wp-translate'); ?></h3>
    <p style="float: right; width 50%; margin-right: 14px;"><strong><em><a href="http://labs.hahncreativegroup.com/wp-translate-pro/"><?php _e('Try WP Translate Pro', 'wp-translate'); ?></a></em></strong></p>
    <div style="clear: both;"></div>
    <form name="wp_translate_settings_form" action="<?php echo str_replace( '%7E', '~', $_SERVER['REQUEST_URI']); ?>" method="post">
    <input type="hidden" name="editOptions" vale="true" />
	<?php wp_nonce_field('wp_translate','wp_translate'); ?>
    <select id="defaultLanguage" name="defaultLanguage">
                    <option value="auto" <?php if($wpTranslateOptions['default_language'] == 'auto') echo esc_attr('selected'); ?>><?php _e('Detect language', 'wp-translate'); ?></option>
                    <option value="af" <?php if($wpTranslateOptions['default_language'] == 'af') echo esc_attr('selected'); ?>><?php _e('Afrikaans', 'wp-translate'); ?></option>
                    <option value="sq" <?php if($wpTranslateOptions['default_language'] == 'sq') echo esc_attr('selected'); ?>><?php _e('Albanian', 'wp-translate'); ?></option>
                    <option value="ar" <?php if($wpTranslateOptions['default_language'] == 'ar') echo esc_attr('selected'); ?>><?php _e('Arabic', 'wp-translate'); ?></option>
                    <option value="hy" <?php if($wpTranslateOptions['default_language'] == 'hy') echo esc_attr('selected'); ?>><?php _e('Armenian', 'wp-translate'); ?></option>
                    <option value="az" <?php if($wpTranslateOptions['default_language'] == 'az') echo esc_attr('selected'); ?>><?php _e('Azerbaijani', 'wp-translate'); ?></option>
                    <option value="eu" <?php if($wpTranslateOptions['default_language'] == 'eu') echo esc_attr('selected'); ?>><?php _e('Basque', 'wp-translate'); ?></option>
                    <option value="be" <?php if($wpTranslateOptions['default_language'] == 'be') echo esc_attr('selected'); ?>><?php _e('Belarusian', 'wp-translate'); ?></option>
                    <option value="bg" <?php if($wpTranslateOptions['default_language'] == 'bg') echo esc_attr('selected'); ?>><?php _e('Bulgarian', 'wp-translate'); ?></option>
                    <option value="ca" <?php if($wpTranslateOptions['default_language'] == 'ca') echo esc_attr('selected'); ?>><?php _e('Catalan', 'wp-translate'); ?></option>
                    <option value="zh-CN" <?php if($wpTranslateOptions['default_language'] == 'zh-CN') echo esc_attr('selected'); ?>><?php _e('Chinese (Simplified)', 'wp-translate'); ?></option>
                    <option value="zh-TW" <?php if($wpTranslateOptions['default_language'] == 'zh-TW') echo esc_attr('selected'); ?>><?php _e('Chinese (Traditional)', 'wp-translate'); ?></option>
                    <option value="hr" <?php if($wpTranslateOptions['default_language'] == 'hr') echo esc_attr('selected'); ?>><?php _e('Croatian', 'wp-translate'); ?></option>
                    <option value="cs" <?php if($wpTranslateOptions['default_language'] == 'cs') echo esc_attr('selected'); ?>><?php _e('Czech', 'wp-translate'); ?></option>
                    <option value="da" <?php if($wpTranslateOptions['default_language'] == 'da') echo esc_attr('selected'); ?>><?php _e('Danish', 'wp-translate'); ?></option>
                    <option value="nl" <?php if($wpTranslateOptions['default_language'] == 'nl') echo esc_attr('selected'); ?>><?php _e('Dutch', 'wp-translate'); ?></option>
                    <option value="en" <?php if($wpTranslateOptions['default_language'] == 'en') echo esc_attr('selected'); ?>><?php _e('English', 'wp-translate'); ?></option>
                    <option value="et" <?php if($wpTranslateOptions['default_language'] == 'et') echo esc_attr('selected'); ?>><?php _e('Estonian', 'wp-translate'); ?></option>
                    <option value="tl" <?php if($wpTranslateOptions['default_language'] == 'tl') echo esc_attr('selected'); ?>><?php _e('Filipino', 'wp-translate'); ?></option>
                    <option value="fi" <?php if($wpTranslateOptions['default_language'] == 'fi') echo esc_attr('selected'); ?>><?php _e('Finnish', 'wp-translate'); ?></option>
                    <option value="fr" <?php if($wpTranslateOptions['default_language'] == 'fr') echo esc_attr('selected'); ?>><?php _e('French', 'wp-translate'); ?></option>
                    <option value="gl" <?php if($wpTranslateOptions['default_language'] == 'gl') echo esc_attr('selected'); ?>><?php _e('Galician', 'wp-translate'); ?></option>
                    <option value="ka" <?php if($wpTranslateOptions['default_language'] == 'ka') echo esc_attr('selected'); ?>><?php _e('Georgian', 'wp-translate'); ?></option>
                    <option value="de" <?php if($wpTranslateOptions['default_language'] == 'de') echo esc_attr('selected'); ?>><?php _e('German', 'wp-translate'); ?></option>
                    <option value="el" <?php if($wpTranslateOptions['default_language'] == 'el') echo esc_attr('selected'); ?>><?php _e('Greek', 'wp-translate'); ?></option>
                    <option value="ht" <?php if($wpTranslateOptions['default_language'] == 'ht') echo esc_attr('selected'); ?>><?php _e('Haitian Creole', 'wp-translate'); ?></option>
                    <option value="iw" <?php if($wpTranslateOptions['default_language'] == 'iw') echo esc_attr('selected'); ?>><?php _e('Hebrew', 'wp-translate'); ?></option>
                    <option value="hi" <?php if($wpTranslateOptions['default_language'] == 'hi') echo esc_attr('selected'); ?>><?php _e('Hindi', 'wp-translate'); ?></option>
                    <option value="hu" <?php if($wpTranslateOptions['default_language'] == 'hu') echo esc_attr('selected'); ?>><?php _e('Hungarian', 'wp-translate'); ?></option>
                    <option value="is" <?php if($wpTranslateOptions['default_language'] == 'is') echo esc_attr('selected'); ?>><?php _e('Icelandic', 'wp-translate'); ?></option>
                    <option value="id" <?php if($wpTranslateOptions['default_language'] == 'id') echo esc_attr('selected'); ?>><?php _e('Indonesian', 'wp-translate'); ?></option>
                    <option value="ga" <?php if($wpTranslateOptions['default_language'] == 'ga') echo esc_attr('selected'); ?>><?php _e('Irish', 'wp-translate'); ?></option>
                    <option value="it" <?php if($wpTranslateOptions['default_language'] == 'it') echo esc_attr('selected'); ?>><?php _e('Italian', 'wp-translate'); ?></option>
                    <option value="ja" <?php if($wpTranslateOptions['default_language'] == 'ja') echo esc_attr('selected'); ?>><?php _e('Japanese', 'wp-translate'); ?></option>
                    <option value="ko" <?php if($wpTranslateOptions['default_language'] == 'ko') echo esc_attr('selected'); ?>><?php _e('Korean', 'wp-translate'); ?></option>
                    <option value="lv" <?php if($wpTranslateOptions['default_language'] == 'lv') echo esc_attr('selected'); ?>><?php _e('Latvian', 'wp-translate'); ?></option>
                    <option value="lt" <?php if($wpTranslateOptions['default_language'] == 'lt') echo esc_attr('selected'); ?>><?php _e('Lithuanian', 'wp-translate'); ?></option>
                    <option value="mk" <?php if($wpTranslateOptions['default_language'] == 'mk') echo esc_attr('selected'); ?>><?php _e('Macedonian', 'wp-translate'); ?></option>
                    <option value="ms" <?php if($wpTranslateOptions['default_language'] == 'ms') echo esc_attr('selected'); ?>><?php _e('Malay', 'wp-translate'); ?></option>
                    <option value="mt" <?php if($wpTranslateOptions['default_language'] == 'mt') echo esc_attr('selected'); ?>><?php _e('Maltese', 'wp-translate'); ?></option>
                    <option value="no" <?php if($wpTranslateOptions['default_language'] == 'no') echo esc_attr('selected'); ?>><?php _e('Norwegian', 'wp-translate'); ?></option>
                    <option value="fa" <?php if($wpTranslateOptions['default_language'] == 'fa') echo esc_attr('selected'); ?>><?php _e('Persian', 'wp-translate'); ?></option>
                    <option value="pl" <?php if($wpTranslateOptions['default_language'] == 'pl') echo esc_attr('selected'); ?>><?php _e('Polish', 'wp-translate'); ?></option>
                    <option value="pt" <?php if($wpTranslateOptions['default_language'] == 'pt') echo esc_attr('selected'); ?>><?php _e('Portuguese', 'wp-translate'); ?></option>
                    <option value="ro" <?php if($wpTranslateOptions['default_language'] == 'ro') echo esc_attr('selected'); ?>><?php _e('Romanian', 'wp-translate'); ?></option>
                    <option value="ru" <?php if($wpTranslateOptions['default_language'] == 'ru') echo esc_attr('selected'); ?>><?php _e('Russian', 'wp-translate'); ?></option>
                    <option value="sr" <?php if($wpTranslateOptions['default_language'] == 'sr') echo esc_attr('selected'); ?>><?php _e('Serbian', 'wp-translate'); ?></option>
                    <option value="sk" <?php if($wpTranslateOptions['default_language'] == 'sk') echo esc_attr('selected'); ?>><?php _e('Slovak', 'wp-translate'); ?></option>
                    <option value="sl" <?php if($wpTranslateOptions['default_language'] == 'sl') echo esc_attr('selected'); ?>><?php _e('Slovenian', 'wp-translate'); ?></option>
                    <option value="es" <?php if($wpTranslateOptions['default_language'] == 'es') echo esc_attr('selected'); ?>><?php _e('Spanish', 'wp-translate'); ?></option>
                    <option value="sw" <?php if($wpTranslateOptions['default_language'] == 'sw') echo esc_attr('selected'); ?>><?php _e('Swahili', 'wp-translate'); ?></option>
                    <option value="sv" <?php if($wpTranslateOptions['default_language'] == 'sv') echo esc_attr('selected'); ?>><?php _e('Swedish', 'wp-translate'); ?></option>
                    <option value="th" <?php if($wpTranslateOptions['default_language'] == 'th') echo esc_attr('selected'); ?>><?php _e('Thai', 'wp-translate'); ?></option>
                    <option value="tr" <?php if($wpTranslateOptions['default_language'] == 'tr') echo esc_attr('selected'); ?>><?php _e('Turkish', 'wp-translate'); ?></option>
                    <option value="uk" <?php if($wpTranslateOptions['default_language'] == 'uk') echo esc_attr('selected'); ?>><?php _e('Ukrainian', 'wp-translate'); ?></option>
                    <option value="ur" <?php if($wpTranslateOptions['default_language'] == 'ur') echo esc_attr('selected'); ?>><?php _e('Urdu', 'wp-translate'); ?></option>
                    <option value="vi" <?php if($wpTranslateOptions['default_language'] == 'vi') echo esc_attr('selected'); ?>><?php _e('Vietnamese', 'wp-translate'); ?></option>
                    <option value="cy" <?php if($wpTranslateOptions['default_language'] == 'cy') echo esc_attr('selected'); ?>><?php _e('Welsh', 'wp-translate'); ?></option>
                    <option value="yi" <?php if($wpTranslateOptions['default_language'] == 'yi') echo esc_attr('selected'); ?>><?php _e('Yiddish', 'wp-translate'); ?></option>
                </select>
                <h3><?php _e('Translation Tracking - Google Analytics', 'wp-translate'); ?></h3>
                <label><?php _e('Tracking enabled', 'wp-translate'); ?>:</label> <input type="checkbox" name="trackingEnabled" value="true"<?php echo ($wpTranslateOptions['tracking_enabled']) ? " checked='yes'" : ""; ?> />
                <br />
                <label><?php _e('Tracking ID (UA#)', 'wp-translate'); ?></label>: <input type="text" name="trackingId" value="<?php echo esc_attr($wpTranslateOptions['tracking_id']); ?>" />              
                
				<h3><?php _e('Exclude Mobile Browsers from Translations', 'wptranslate'); ?></h3>
				<label><?php _e('Exclude Mobile Browsers', 'wptranslate'); ?>:</label> <input type="checkbox" name="excludeMobile" value="true"<?php echo ($wpTranslateOptions['exclude_mobile']) ? " checked='yes'" : ""; ?> />
				<h3><?php _e('Translation Toolbar Auto Display', 'wptranslate'); ?></h3>
				<label><?php _e('Toolbar Auto Display', 'wptranslate'); ?>:</label> <input type="checkbox" name="autoDisplay" value="true"<?php echo ($wpTranslateOptions['auto_display']) ? " checked='yes'" : ""; ?> />
                <p class="major-publishing-actions"><input type="submit" name="Submit" class="button-primary" value="<?php _e('Save Settings', 'wp-translate'); ?>" /></p>
				</form>
                <br />
                <div style="float: left; width: 60%; min-width: 488px;">
                <p><strong><a href="http://labs.hahncreativegroup.com/wp-translate-pro/?src=wpt" target="_blank"><?php _e('Try WP Translate Pro', 'wp-translate'); ?></a></strong><br /><em><?php _e('Pro features include: Enhanced widget positioning and ad free', 'wp-translate'); ?>...</em></p>
<p><strong><?php _e('Try WP Easy Gallery Pro', 'wp-translate'); ?></strong><br /><em><?php _e('Pro Features include: Multi-image uploader, Enhanced admin section for easier navigation, Image preview pop-up, and more', 'wp-translate'); ?>...</em></p>
<p><a href="http://labs.hahncreativegroup.com/wordpress-gallery-plugin/?src=wpt" target="_blank"><img title="WP-Easy-Gallery-Pro_468x88" src="<?php echo plugins_url( '/images/WP-Easy-Gallery-Pro_468x88.gif', __FILE__ ); ?>" alt="" border="0" width="468" height="88" /></a></p>
<p><strong><?php _e('Try Custom Post Donations Pro', 'wp-translate'); ?></strong><br /><em><?php _e('This WordPress plugin will allow you to create unique customized PayPal donation widgets to insert into your WordPress posts or pages and accept donations. Features include: Multiple Currencies, Multiple PayPal accounts, Custom donation form display titles, and more.', 'wp-translate'); ?></em></p>
<p><a href="http://labs.hahncreativegroup.com/wordpress-paypal-plugin/?src=wpt" target="_blank"><img src="<?php echo plugins_url( '/images/CustomPostDonationsPro-Banner.gif', __FILE__ ); ?>" width="374" height="60" border="0" alt="Custom Post Donations Pro" /></a></p>
<p><strong><?php _e('Try ReFlex Gallery Pro', 'wp-translate'); ?></strong><br /><em><?php _e('ReFlex Gallery is a fully responsive WordPress image gallery plugin that is actually two galleries in one.', 'wp-translate'); ?></em></p>
<p><a href="http://wordpress-photo-gallery.com/?src=wpt" target="_blank"><img src="<?php echo plugins_url( '/images/reflex_gallery_page_image_374x190_v4.jpg', __FILE__ ); ?>" width="374" height="190" alt="ReFlex Gallery - Responsive WordPress Photo Gallery" border="0" /></a></p>
<p><strong><?php _e('Try Email Obfuscate', 'wp-translate'); ?></strong><br /><em><?php _e('Email Obfuscate is a Lightweight WordPress/jQuery plugin that prevents spam-bots from harvesting your email addresses by dynamically obfuscating email addresses on your site.', 'wp-translate'); ?></em><br /><a href="http://codecanyon.net/item/wordpressjquery-email-obfuscate-plugin/721738?ref=HahnCreativeGroup" target="_blank">Email Obfuscate Plugin</a></p>
<p><a href="http://codecanyon.net/item/wordpressjquery-email-obfuscate-plugin/721738?ref=HahnCreativeGroup" target="_blank"><img alt="WordPress/jQuery Email Obfuscate Plugin - CodeCanyon Item for Sale" border="0" class="landscape-image-magnifier preload no_preview" height="80" src="<?php echo plugins_url( '/images/WordPress-Email-Obfuscate_thumb_80x80.jpg', __FILE__ ); ?>" title="" width="80"></a></p>
<p><em><?php _e('Please consider making a donation for the continued development of this plugin. Thank you.', 'wp-translate'); ?></em></p>
<p><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=EJVXJP3V8GE2J" target="_blank"><img src="<?php echo plugins_url( '/images/btn_donateCC_LG.gif', __FILE__ ); ?>" border="0" alt="PayPal - The safer, easier way to pay online!"><img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1"></a></p>
</div>
<div id="rss" style="float: right; width: 25%; height: 700px; padding: 10px; min-width: 165px;">
</div>
<script type="text/javascript">
jQuery(document).ready(function(){			
	jQuery.ajax({url: "<?php echo plugins_url( '/rss.php', __FILE__ ); ?>",success:function(result){
		jQuery("#rss").html(result);
  }});
});
</script>
</div>