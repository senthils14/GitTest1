public class FridgeSample {
Private String modelNumber;
Private Integer numberInStock;
public void setModelNumber(String theModelNumber) {
modelNumber = theModelNumber;
}
public String getModelNumber() {
return modelNumber;
}
    public void updateStock(Integer justSold) 
        {
            numberInStock = numberInStock - justSold;
        }
}