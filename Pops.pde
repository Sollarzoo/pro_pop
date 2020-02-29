//====== Coding by Solazo ====== 
//========= Weibo Solazo ======= 
//外观部分在display里

class Pop {
  //===== 参数声明 ===== 
  //外部数据
  float size1, size2, size3, size4, size5, size6, size7, size8, size9, size10, size11, size12;
  float size13, size14, size15, size16, size17, size18, size19, size20;
  float[] size = new float[20];
  float x, y;
  String keyWords;
  TableRow row;
  float scale = 0.9;
  CircleShape cs = new CircleShape();
  BodyDef bd = new BodyDef();
  FixtureDef fd = new FixtureDef();

  Body body;//引用代替坐标

  Pop(float x_, float y_, TableRow Row) {

    //传输数据
    row = Row;
    keyWords = row.getString(0);
    size1 = row.getInt(cirLayer-1)*scale;
    size2 = row.getInt(cirLayer-2)*scale;
    size3 = row.getInt(cirLayer-3)*scale;
    size4 = row.getInt(cirLayer-4)*scale;
    size5 = row.getInt(cirLayer-5)*scale;
    size6 = row.getInt(cirLayer-6)*scale;
    size7 = row.getInt(cirLayer-7)*scale;
    size8 = row.getInt(cirLayer-8)*scale;
    size9 = row.getInt(cirLayer-9)*scale;
    size10 = row.getInt(cirLayer-10)*scale;
    size11 = row.getInt(cirLayer-11)*scale;
    size12 = row.getInt(cirLayer-12)*scale;
    size13 = row.getInt(cirLayer-13)*scale;
    size14 = row.getInt(cirLayer-14)*scale;
    size15 = row.getInt(cirLayer-15)*scale;
    size16 = row.getInt(cirLayer-16)*scale;
    size17 = row.getInt(cirLayer-17)*scale;
    size18 = row.getInt(cirLayer-18)*scale;
    size19 = row.getInt(cirLayer-19)*scale;
    size20 = row.getInt(cirLayer-20)*scale;
    x = x_;
    y = y_;

    //构建物体
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    //构建形状
    cs.m_radius =  box2d.scalarPixelsToWorld(size1/2);

    fd.shape = cs;//将刚刚创建的ps对象赋予给夹具对象
    fd.density = 1;//密度
    fd.friction = 0.3;//摩擦系数
    fd.restitution = 1;//弹性

    body.createFixture(fd);//永夹具连接形状和物体
  }


  //=====这里主要是外观设置========
  void display() {
    //获取物体的角度和位置
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);//Box2D的坐标系和Processing相反
    noFill();//没有填充 填充的话使用fill（）
    //括号里写颜色参数 颜色参数的后面是透明度，区间是0-255 fill(#00000,255)代表透明度是100%，就是不透明
    //fill();

    push();
    //边框（颜色）
    stroke(0, 0);
    //边框（宽度）
    strokeWeight(2);
    //绘制圆形
    ellipseMode(CENTER);
    println(keyWords);

    if (keyWords.equals("上海")==true) {
      stroke(#F5DB45);
      //stroke(#F5DB45);
    } else if (keyWords.equals("新冠肺炎")==true) {
      stroke(#F545EC);
      //stroke();
    } else {
      stroke(255);
    }

    //float color1 = map(size1-size2, 0, 40, 0, 360);

    //println(size1-size2);


    ellipse(0, 0, size1, size1);


    ellipse(0, 0, size2, size2);


    ellipse(0, 0, size3, size3);


    // fill(0, 100, 100, size3-size4);
    ellipse(0, 0, size4, size4);

    // fill(0, 100, 100, size4-size5);
    ellipse(0, 0, size5, size5);

    // fill(0, 100, 100, size5-size6);
    ellipse(0, 0, size6, size6);

    //fill(0, 100, 100, size6-size7);
    ellipse(0, 0, size7, size7);

    //fill(0, 100, 100, size7-size8);
    ellipse(0, 0, size8, size8);

    //fill(0, 100, 100, size8-size9);
    ellipse(0, 0, size9, size9);

    //fill(0, 100, 100, size9-size10);
    ellipse(0, 0, size10, size10);

    //fill(0, 100, 100, size10-size11);
    ellipse(0, 0, size11, size11);

    //fill(0, 100, 100, size11-size12);
    ellipse(0, 0, size12, size12);

    // fill(0, 100, 100, size12-size13);
    ellipse(0, 0, size13, size13);

    //fill(0, 100, 100, size13-size14);
    ellipse(0, 0, size14, size14);

    //fill(0, 100, 100, size14-size15);
    ellipse(0, 0, size15, size15);

    // fill(0, 100, 100, size15-size16);
    ellipse(0, 0, size16, size16);

    //fill(0, 100, 100, size16-size17);
    ellipse(0, 0, size17, size17);

    //fill(0, 100, 100, size17-size18);
    ellipse(0, 0, size18, size18);

    //fill(0, 100, 100, size18-size19);
    ellipse(0, 0, size19, size19);

    //fill(0, 100, 100, size19-size20);
    ellipse(0, 0, size20, size20);
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

  //Vec2 attract(Pop p) {
  //  Vec2 pos = body.getWorldCenter(); //想Box2D询问位置
  //  Vec2 popPos = p.body.getWorldCenter();

  //  Vec2 force = pos.sub(popPos);
  //  float distance = force.length();
  //  distance = constrain(distance, 1, 5);
  //  force.normalize();
  //  float strength = (G*1*p.body.m_mass)/(distance*distance);
  //  force.mulLocal(strength);

  //  return force;
  //}

  void applyForce(Vec2 force) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }
}
