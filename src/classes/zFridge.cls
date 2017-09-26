public class zFridge {
    public string modelNumber;
    public integer numberInStock;
        
    public void updateStock(Integer justSold) {
    numberInStock = numberInStock - justSold;
        
    zFridge myfridge = new zfridge();
    myfridge.modelNumber = 'MX-O';
    myFridge.numberInStock = 100;
    myFridge.updateStock(20);
    
    zFridge myOtherFridge = new zFridge();
    myOtherFridge.modelNumber = 'MX-Y';
    myOtherFridge.numberInStock = 50;
    
    System.debug('myFridge.numberInStock=' + myFridge.numberInStock);
    System.debug('myOtherFridge.numberInStock=' + myOtherFridge.numberInStock);
    }
  }