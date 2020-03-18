//====== Coding by Solazo ====== 
//========= Weibo Solazo ======= 


class Pop {
  //===== 参数声明 ===== 

  Body body;//引用代替坐标
  float x, y;
  int cato, COVID_19;
  String keyWords;
  TableRow row;
  float scale = 1;
  float[] size = new float[cirLayer];
  float R, R1, R2;

  //定义一个body
  BodyDef bd = new BodyDef();
  //定义一个圆形
  CircleShape cs = new CircleShape();
  FixtureDef fd = new FixtureDef();

  Pop(float x_, float y_, TableRow row) {

    //传输数据
    cato = row.getInt(0);
    //println(cato);
    keyWords = row.getString(1);

    COVID_19 = row.getInt(8);
    // println(cirLayer);
    //循环读取关键词的数量
    //疫情前的图 若要完整的请删除 -12  

    x = x_;
    y = y_;
    R = 0;



    for (int i = 2; i<size.length; i++) {
      size[i] = row.getInt(i)*scale;
    }
    makeBody();
  }
  //=====这里主要是外观设置========

  void display() {
    //获取物体的角度和位置
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();  
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);//Box2D的坐标系和Processing相反
    push();
    noFill();
    if (cato == 1) {
      stroke(#459aff);
    } else if (cato == 2) {
      stroke(#53d3d3);
    } else if (cato == 3) {
      stroke(#2247ff);
    } else if (cato == 4) {
      stroke(#fff800);
    } else {
      stroke(#ff5757);
    }

    //边框（宽度）
    strokeWeight(2);
    //循环绘制圆形
    int time = parseInt(map(millis(), 0, 60000, 0, 60));

    while (time > size.length) {
      time = size.length;
    }
    println(time);
    float speed = 5;
    for (int i = 0; i<time; i++) { 
      Ani.to(this, speed, "R", size[i]);
      Ani.to(this, speed, "R1", size[i]+10);
      Ani.to(this, speed, "R2", size[i]-10);
      circle(0, 0, R);
      circle(0, 0, R1);
      circle(0, 0, R2);
      if(i<time-1.5){
      circle(0, 0, size[i]);
      circle(0, 0, size[i]+10);
      circle(0, 0, size[i]-10);}
    }

//    if (time > 8) {
//      push();
//      stroke(#ff5757);
//      strokeWeight(5);
//      circle(0, 0, size[8]);
//      pop();
//    }

    pop();
    //====== 字符 ======
    //push();
    //fill(0);
    //textFont(font);
    //textSize(32);
    //text(keyWords, 0, 0);
    //pop();

    popMatrix();
  }


  void killBody() {
    box2d.destroyBody(body);
  }

  void makeBody() {
    //确定位置
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    cs.m_radius =  box2d.scalarPixelsToWorld((size[size.length-1]+10)/2);
    fd.shape = cs;//将刚刚创建的ps对象赋予给夹具对象
    fd.density = 2;//密度
    fd.friction = 0.01;//摩擦系数
    fd.restitution = 0.3;//弹性
    body.createFixture(fd);//夹具连接形状和物体
  }
}
