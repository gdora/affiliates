<style>
::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: #999;
}
</style>
<div class="aff-wrap">
    <?php
    //echo get_bloginfo('admin_email');
    include WPAM_BASE_DIRECTORY . "/html/affiliate_cp_nav.php";
    
    // Check balance to disable request payment button
    $MinPayoutAmountOption =  get_option(WPAM_PluginConfig::$MinPayoutAmountOption);
    list($balance, $trash) = explode(".",  $this->viewData['accountStanding']);
    
    if ( $balance < $MinPayoutAmountOption ) {
		$paymentDisabled = "disabled";
	
	} else {
		$paymentDisabled = "";
	}
	
	
//print "<pre>"; print_r($this->viewData); print "</pre>";
	
    ?>
    <div class="wrap">

        <table class="pure-table">
            <thead>
                <tr>
                    <th colspan="2"><?php _e('Account Summary', 'affiliates-manager') ?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?php _e('Balance', 'affiliates-manager') ?></td>
                    <td><?php echo wpam_format_money($this->viewData['accountStanding']) ?></td>
                </tr>
               <tr>
                    <td colspan="2" align="center">
						
						<form method="post" id="paymentrequest" class="pure-form" onsubmit="return confirm('<?php _e('Are you sure you want to send request for payment', 'affiliates-manager'); ?>')">
						<input type="hidden" name="action" value="requestpayment"> 

						<input id="requestPayment" class="pure-button pure-button-active" name="wpam-request-payment" 
						value="<?php _e('Request payment', 'affiliates-manager') ?>" 
						<?php 
						if ($paymentDisabled == 'disabled') {
							echo 'title="';
							_e('Your balance is less than the minumum payout amount', 'affiliates-manager');
							echo '"'; 
						}
						?>
						 type="submit" <?php echo $paymentDisabled ?>><br>
						</form>
						
						</td>
                </tr>
            </tbody>
        </table>

		<br>
		
		<!-- Affilate or partner -->
		<?php
		$affiliateID = $this->viewData['affiliate']->affiliateId;
		
		if (WPAM_Plugin::isPartner($affiliateID)) {
		?>
		<table class="pure-table">
            <thead>
                <tr>
                    <th colspan="4"><?php _e('My affilates', 'affiliates-manager') ?></th>
                </tr>
            </thead>
            <tbody>
				<tr>
				<td><?php _e("Name", 'affiliates-manager'); ?></td>
				<td><?php _e("Income", 'affiliates-manager'); ?></td>
				</tr>
				<?php
				global $wpdb;
				
				$query = "select concat(af.firstName, ' ', af.lastName) name, COALESCE(SUM(IF(tr.status <> 'failed', amount,0)),0) standing 
					from " . WPAM_AFFILIATES_TBL . " tr, " . WPAM_TRANSACTIONS_TBL . " af
					where 
					af.partner_id = $affiliateID
					and tr.type = 'adjustment'
					and af.affiliateId = tr.affiliateId
					group by 1
					order by 1";
				
				$data = $wpdb->get_results($query, ARRAY_A);
				
				
				
				foreach ($data as $aff) {
					print "<tr>";
					print "<td>{$aff['name']}</td>";
					print "<td>{$aff['standing']}</td>";
					
					print "</tr>";
					
				}
				
				?>
			</tbody>
		</table>
		
		<?php	
		} else {
		?>
	
		
		 <table class="pure-table">
            <thead>
                <tr>
                    <th colspan="4"><?php _e('My broker accounts', 'affiliates-manager') ?></th>
                </tr>
            </thead>
            <tbody>
				<?php
				// Broker accounts
				$brokerAccounts = json_decode($this->viewData['affiliate']->broker_accounts);
				if (sizeof($brokerAccounts) > 0) {
				?>
				<tr>
				<td><?php _e("Name", 'affiliates-manager'); ?></td>
				<td><?php _e("Id", 'affiliates-manager'); ?></td>
				<td><?php _e("Type", 'affiliates-manager'); ?></td>
				<td></td>
				</tr>
				<?php 
				
					
				
				
					foreach ($brokerAccounts as $account) {
						?>
						<tr>
						<td><?php print $account->name ?></td>
						<td><?php print $account->id ?></td>
						<td><?php print $account->type ?></td>
						<td>
						<form method="post" id="deleteBroker" name="delete_broker" class="pure-form" onsubmit="return confirm('<?php _e('Are you sure you want to delete your broker account', 'affiliates-manager'); ?>')">
							<input type="hidden" name="broker_name" value="<?php print $account->name ?>"> 
							<input type="hidden" name="broker_id" value="<?php print $account->id ?>"> 
							<input type="hidden" name="broker_type" value="<?php print $account->type ?>"> 
							<input type="hidden" name="action" value="delete"> 
							<input type="submit" id="requestPayment" class="pure-button pure-button-active" style="float:right; width: 30px; padding:10px;" value="X" title="Delete" >
						</form>
						</td>
						</tr>
						<?php
					}
				} else {
					print "<tr><td colspan='3'>";
					_e('No saved broker accounts', 'affiliates-manager');
					print "</td></tr>";
				}
						
				?>
				<tr><th colspan="4"><?php _e('Add new borker account', 'affiliates-manager') ?></th></tr>
                <tr>
                    <td align="center" th colspan="4">
                    <form method="post" id="addBroker" class="pure-form" onsubmit="return confirm('<?php _e('Are you sure you want to add new broker account', 'affiliates-manager'); ?>')">
						<input type="text" name="new_broker_name" placeholder="<?php _e('Type new broker account name') ?>">
						<input type="text" name="new_broker_id" placeholder="<?php _e('Type new broker account id') ?>">
						<input type="text" name="new_broker_type" placeholder="<?php _e('Type new broker account type') ?>">
						<input id="requestPayment" class="pure-button pure-button-active" name="wpam-add-broker" value="<?php _e('Add', 'affiliates-manager') ?>" type="submit">
						<input type='hidden' name='action' value='add_broker'>
						</form>
                    
                    </td>
                </tr>
               
            </tbody>
        </table>
        <!-- /Affiliate or partner -->
		<?php } ?>
    </div>
</div>

