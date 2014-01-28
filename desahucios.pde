/*
 EVICTION COUNTER - 
 A social performance to display on a facade
 the number of evictions per minute in Spain
 during the first 3 months of 2013.
 
 It does not intend to be an exact counter,
 but making the obsever more aware of the
 dramatical situation on each increment.
 
 CONTADOR DE DESAHUCIOS -
 Un acto social para proyectar en
 una fachada el número de desahucios por
 minuto en España durante los primeros
 meses de 2013.
 
 No pretende dar un número exacto sino
 hacer más consciente al expectador de
 la dramática situación en cada incremento.   
 
 Estimated data during the 2nd quartile of 2012 from:
 Datos estimados durante el segundo trimestre de 2012 en: 
 http://www.publico.es/espana/439864/el-numero-de-desahucios-bate-todos-los-records-46-559-en-tres-meses-de-2012
 
 On Starting the eviciton counter updates to the current date according to the extimated eviction Rate.
 Al ejecutarse el número del contador se actualiza a la fecha actual según la tasa promedio estimada de desahucios.
 
 Rafael Redondo Tejedor CC-BY-NC-SA (2013)
 */

import java.util.Date;     // no needed by javascript

/* Ajuste general de texto
   General text settings
 */

int lineTopPadding = 130;  // margen superior
int lineHeight = 60;       // altura de linea
int fontSizeRef = 50;      // tamaño de fuente/letra

/* Tasa de desahucios
   Eviction Rate
 */
int evictionNumber = 46559;                                     // desahucios en 3 meses (2do trimestre 2012)
float evictionRate =  float(evictionNumber)/(30*3*24*60*60);    // Tasa desahucios/segundo

/* Fecha de comienzo
   Starting Date
 */
String currentTime, initDate = "1 Ene 2013";

/* Otras variables
   Other variables
 */
int frameR = 2;            // 2 refrescos de pantalla por segundo
PFont font;
Date d;
int windowWidth = 700, windowHeight = 525;
int line, timeCont = 0;
long timestamp;
String currentDate, currentMonth, currentYear, currentHour, currentMinute, currentSecond;
String[] month = new String[12];


void setup() {
  frameRate(frameR);
  //  windowWidth = displayWidth; 
  //  windowHeight = displayHeight;
  size(windowWidth, windowHeight);
  String[] fontList = PFont.list();
  font = createFont(fontList[0], 15);
  translate(0, 0);

  month[0] = "Ene";
  month[1] = "Feb";
  month[2] = "Mar";
  month[3] = "Abr";
  month[4] = "May";
  month[5] = "Jun";
  month[6] = "Jul";
  month[7] = "Ago";
  month[8] = "Sept";
  month[9] = "Oct";
  month[10] = "Nov";
  month[11] = "Dic"; 

  /* Ajuste de desahucios hasta la fecha actual
     Adjusting evictions up to the current date
   */
  d = new Date();
  Date intermediateDate = new Date("4/1/2013"); // Ojo Mes/Dia/Año
  evictionNumber += int(evictionRate * ( d.getTime() - intermediateDate.getTime() ) / 1000);
} 

void draw()
{   
  background(0);
  fill(255);
  textAlign(CENTER);

  timeCont++;

  /* Linea 1 - line 1*/
  line = 1;
  textFont(font, fontSizeRef+88);
  text(evictionNumber+int(timeCont*evictionRate/frameR), windowWidth/2, lineTopPadding+lineHeight*line);

  /* Linea 2 - line 2*/
  line = 2;
  textFont(font, fontSizeRef);
  text("Familias desahuciadas", windowWidth/2, lineTopPadding+lineHeight*line);

  /* Linea 3 - line 3*/
  line = 4;
  d = new Date();
  currentDate = d.getDate()+"";
  currentMonth = month[d.getMonth()];
  currentYear = d.getYear()+1900+"";
  textFont(font, fontSizeRef-14);
  text(initDate + " - " + currentDate + " " + currentMonth + " " + currentYear, windowWidth/2, lineTopPadding+lineHeight*line);

  /* Linea 4 - line 4*/
  line = 5;
  currentHour = d.getHours()+"";
  if (parseInt(currentHour) < 10) {
    currentHour = "0" + currentHour;
  }
  currentMinute = d.getMinutes()+"";
  if (parseInt(currentMinute) < 10) {
    currentMinute = "0" + currentMinute;
  }
  currentSecond = d.getSeconds()+"";
  if (parseInt(currentSecond) < 10) {
    currentSecond = "0" + currentSecond;
  }
  textFont(font, fontSizeRef-14);
  text(currentHour + ":" + currentMinute + ":" + currentSecond, windowWidth/2, lineTopPadding+lineHeight*line);
}

boolean sketchFullScreen(){
  return true;
}
