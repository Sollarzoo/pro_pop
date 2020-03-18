import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Table data;
PFont font;
Pop[] pops;
int numMax;
int cirLayer;

void loadData() {

  //加载数据
  data = loadTable("潮流up主小侯 3.csv", "header");
  numMax = data.getRowCount();
  cirLayer = data.getColumnCount();
  //println(cirLayer);


  //创建气泡函数
  pops = new Pop[numMax];
}

//程序首次运行函数
void setup() {
  //size(3840, 2160);
  fullScreen();

  frameRate(30);
  //==== 设置字体 ====
  font = createFont("YaHei.ttf", 32);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();//初始化创建2d世界
  box2d.setGravity(0, 0);//设置全局重力

  loadData();//加载数据

  Ani.init(this);

  for (int i = 0; i<pops.length; i++) {
    TableRow row = data.getRow(i);//获取表头
    
    pops[i] = new Pop(random(width/2-1, width/2+1), random(height/2-1, height/2+1), row);
  }
}

//循环绘制函数
void draw() {
  background(255); 
  // smooth();

  box2d.step();//推进时间
  for (Pop p : pops) {
    p.display();
  }
}
