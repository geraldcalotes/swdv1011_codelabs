class Book{
	String title;
	String author;
	int yearPublished;

	Book(this.title,this.author,this.yearPublished);

	void displayDetails()
	{
	  print('Book Title : $title');
	  print('Author : $author');
	  print('Year Published : $yearPublished');
	}


}


void main(){
	var book = Book('The Art of War','Sun Tzu',1601);
	
	book.displayDetails();
}
