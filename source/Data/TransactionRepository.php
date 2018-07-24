<?php
/**
 * @author John Hargrove
 * 
 * Date: Jun 30, 2010
 * Time: 11:06:05 PM
 */

class WPAM_Data_TransactionRepository extends WPAM_Data_GenericRepository
{
	/**
	 * returns object(
	 * 	'balance' => total balance,
	 * 	'credits' => earned credits
	 * 	'debits' => paid out
	 * )
	 * @param  $affiliateId
	 * @return object
	 */
	public function getAccountSummary($affiliateId, $bountyAmount = 0, $dateStart = NULL, $dateEnd = NULL)
	{
		// if partner
		if (WPAM_Plugin::isPartner($affiliateId))  {
			$query = "
			select 
			sum(credits) credits,
			sum(debits) debits,
			sum(adjustments) adjustments,
			sum(standing) standing
			from
			(select
					COALESCE(SUM(IF(type = 'credit', amount, 0)),0) credits,
					COALESCE(SUM(IF(type = 'payout', amount, 0)),0) debits,
					COALESCE(SUM(IF(type = 'adjustment', amount, 0)),0) adjustments,
					COALESCE(SUM(IF(status <> 'failed', amount,0)),0) standing
				FROM
					`{$this->tableName}`
				WHERE
					affiliateId = $affiliateId
			union
			select
			0 credits,
			0 debits,
			0 adjustments,
			round(COALESCE(SUM(IF(status <> 'failed', amount,0)),0) * $bountyAmount / 100, 2) standing
			FROM 
				`{$this->tableName}`
			WHERE 
			affiliateId in (select affiliateId from " . WPAM_AFFILIATES_TBL . " where partner_id = $affiliateId)
			and type = 'adjustment'
			) 	as all_transactions
			";

			if ($dateStart !== NULL)
				$query .= "
					AND dateCreated >= '".date("Y-m-d H:i:s", $dateStart)."'
				";
			if ($dateEnd !== NULL)
				$query .= "
					AND dateCreated < '".date("Y-m-d H:i:s", $dateEnd)."'
				";
		} else {
			$query = "
				select
					COALESCE(SUM(IF(type = 'credit', amount, 0)),0) credits,
					COALESCE(SUM(IF(type = 'payout', amount, 0)),0) debits,
					COALESCE(SUM(IF(type = 'adjustment', amount, 0)),0) adjustments,
					COALESCE(SUM(IF(status <> 'failed', amount,0)),0) standing
				FROM
					`{$this->tableName}`
				WHERE
					affiliateId = $affiliateId
			";

			if ($dateStart !== NULL)
				$query .= "
					AND dateCreated >= '".date("Y-m-d H:i:s", $dateStart)."'
				";
			if ($dateEnd !== NULL)
				$query .= "
					AND dateCreated < '".date("Y-m-d H:i:s", $dateEnd)."'
				";
			
		} 
		$query = $this->db->prepare($query);
		return $this->db->get_row($query);
	}

	public function getBalance( $affiliateId, $dateStart = NULL ) {
		//start witih zero if no date specified
		if ( $dateStart === NULL )
			return 0;
		
		$query = "
			select
				COALESCE(SUM(IF(status <> 'failed', amount,0)),0) balance
			FROM
				`{$this->tableName}`
			WHERE
				affiliateId = %d
			AND dateCreated <= '" . date( 'Y-m-d H:i:s', strtotime( $dateStart ) ) . "'";
		$query = $this->db->prepare($query, $affiliateId);
		return $this->db->get_var($query);		
	}
}
