import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS=20;
public final static int NUM_COLS=NUM_ROWS;
public final static int NUM_BOMBS=200;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs=new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined
void setup ()
{
  size(400, 400);
  textAlign(CENTER, CENTER);
  
  Interactive.make( this );
  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++)
    for (int c = 0; c < NUM_COLS; c++)
      buttons[r][c] = new MSButton(r, c);
  //your code to initialize buttons goes here
  setBombs();
}
public void setBombs()
{
  // contains();
  while (bombs.size()<NUM_BOMBS) {
    int r=(int)(Math.random()*NUM_ROWS);
    int c= (int)(Math.random()*NUM_COLS);
    if (!bombs.contains(buttons[r][c])) {
      bombs.add(buttons[r][c]);
      //System.out.println(r+","+c);
    }
  }
}
void draw ()
{
  background(200,123,219,0);
  if (isWon())
    displayWinningMessage();
}
public boolean isWon()
{
// setLabel()
  
  //your code here
  return false;
}
public void displayLosingMessage()
{
  //your code here
}
public void displayWinningMessage()
{
  //your code here
}
public class MSButton
{
  private int r, c;
  private float x, y, width, height;
  private boolean clicked, marked;
  private String label;
  public MSButton (int rr, int cc)
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    r = rr;
    c = cc; 
    x = c*width;
    y = r*height;
    label = "";
    marked = clicked = false;
    Interactive.add(this); // register it with the manager
  }
  public boolean isMarked()
  {
    return marked;
  }
  public boolean isClicked()
  {
    return clicked;
  }
  // called by manager
  public void mousePressed () 
  {
    clicked = true;
    //your code here
    if (mouseButton ==RIGHT) {
      marked=!marked;
      //if (marked==false)
       // clicked=false;
    } else if (bombs.contains(this))
      displayLosingMessage();
    else if (countBombs(r, c)>0) {
      setLabel(countBombs(r, c)+"");
    } else {
      if (isValid(r+1, c)&&buttons[r+1][c].clicked==false)
        buttons[r+1][c].mousePressed();
      if (isValid(r-1, c)&&buttons[r-1][c].clicked==false)
        buttons[r-1][c].mousePressed();
      if (isValid(r, c+1)&&buttons[r][c+1].clicked==false)
        buttons[r][c+1].mousePressed();
      if (isValid(r, c-1)&&buttons[r][c-1].clicked==false)
        buttons[r][c-1].mousePressed();
      if (isValid(r-1, c-1)&&buttons[r-1][c-1].clicked==false)
        buttons[r-1][c-1].mousePressed();
      if (isValid(r+1, c+1)&&buttons[r+1][c+1].clicked==false)
        buttons[r+1][c+1].mousePressed();
      if (isValid(r-1, c+1)&&buttons[r-1][c+1].clicked==false)
        buttons[r-1][c+1].mousePressed();
      if (isValid(r+1, c-1)&&buttons[r+1][c-1].clicked==false)
        buttons[r+1][c-1].mousePressed();
    }
  }

  public void draw () 
  {    
    if (marked)
      fill(0);
    else if (clicked && bombs.contains(this)) 
      fill(255, 0, 0);
    else if (clicked)
      fill(200);
    else 
    fill(100);
    rect(x, y, width, height);
    fill(0);
    text(label, x+width/2, y+height/2);
  }
  public void setLabel(String newLabel)
  {
    label = newLabel;
  }
  //public boolean isValid(int r, int c)
  //{
  //  int r=(int)(Math.random()*NUM_ROWS);
  //  int c= (int)(Math.random()*NUM_COLS);
  //  if(isValid) ==true&& blobs[r][c-1],isMarked==true blobs[r][c-1],mousePressed();
  //  //your code here
  //  return false;
  //}
  public boolean isValid(int row, int col) {
    if (row>=0&& row<20&&col>=0&&col<20)
      return true;
    return false;
  }
  public int countBombs(int row, int col)
  {
    int numBombs = 0;
    //your code here
    if (isValid(row, col-1)&&bombs.contains(buttons[row][col-1]))
      numBombs++;
    if (isValid(row, col+1)&&bombs.contains(buttons[row][col+1]))
      numBombs++;
    if (isValid(row-1, col)&&bombs.contains(buttons[row-1][col]))
      numBombs++;
    if (isValid(row+1, col)&&bombs.contains(buttons[row+1][col]))
      numBombs++;
    if (isValid(row+1, col+1)&&bombs.contains(buttons[row+1][col+1]))
      numBombs++;
    if (isValid(row-1, col-1)&&bombs.contains(buttons[row-1][col-1]))
      numBombs++; 
    if (isValid(row+1, col-1)&&bombs.contains(buttons[row+1][col-1]))
      numBombs++;
    if (isValid(row-1, col+1)&&bombs.contains(buttons[row-1][col+1]))
      numBombs++;
    return numBombs;
  }
}


