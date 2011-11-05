public class TestController{

	Account account;

	public PageReference save() {
		update account;
		return null;
	}

	public String getName() {
		return 'MyController';
	}

	public Account getAccount() {
		if(account == null) 
			account = [select id, name, site from Account 
		where id = :ApexPages.currentPage().getParameters().get('id')];
		return account; 
	} 
}