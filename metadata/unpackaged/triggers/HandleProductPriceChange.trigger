trigger HandleProductPriceChange on Merchandise__c bulk (after update) {

	List<Line_Items__c> openLineItems =
			[SELECT j.Price__c, j.Merchandise__r.Price__c
		FROM Line_Items__c j
	WHERE j.Invoice_Statement__r.Status__c = 'Negotiating'
	AND j.Merchandise__r.id IN :Trigger.new
		FOR UPDATE];

	for (Line_Items__c li: openLineItems) {
		if ( li.Merchandise__r.Price__c < li.Price__c ){
			li.Price__c = li.Merchandise__r.Price__c;
		}
	}//99
	update openLineItems;
	
}