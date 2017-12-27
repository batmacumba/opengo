/* Change these to match your pins */
const int GoButton = 5;
const int PauseButton = 6;
const int StopButton = 7;
const int LoadButton = 8;
const int UpButton = 9;
const int DownButton = 10;

/* Setup function */
void setup() {
  Serial.begin(9600);
  pinMode(GoButton, INPUT_PULLUP);
  pinMode(PauseButton, INPUT_PULLUP);
  pinMode(StopButton, INPUT_PULLUP);
  pinMode(LoadButton, INPUT_PULLUP);
  pinMode(UpButton, INPUT_PULLUP);
  pinMode(DownButton, INPUT_PULLUP);
}

/* Loop */
void loop() {
  if (digitalRead(GoButton) == LOW) {
    Serial.print("QLab_Go");
    while (digitalRead(GoButton) == LOW) ;
  }
  if (digitalRead(PauseButton) == LOW) {
    Serial.print("QLab_Pause");
    while (digitalRead(PauseButton) == LOW) ;
  }
  if (digitalRead(StopButton) == LOW) {
    Serial.print("QLab_Stop");
    while (digitalRead(StopButton) == LOW) ;
  }
  if (digitalRead(LoadButton) == LOW) {
    Serial.print("QLab_Load");
    while (digitalRead(LoadButton) == LOW) ;
  }
  if (digitalRead(UpButton) == LOW) {
    Serial.print("QLab_Up");
    while (digitalRead(UpButton) == LOW) ;
  }
  if (digitalRead(DownButton) == LOW) {
      Serial.print("QLab_Down");
      while (digitalRead(DownButton) == LOW) ;
  }
  delay(5);
  /**************************
  // test function
  Serial.print("QLab_Go");
  delay(1000);
  Serial.print("QLab_Pause");
  delay(1000);
  Serial.print("QLab_Stop");
  delay(1000);
  Serial.print("QLab_Load");
  delay(1000);
  Serial.print("QLab_Up");
  delay(1000);
  Serial.print("QLab_Down");
  delay(1000);
 **************************/
}
