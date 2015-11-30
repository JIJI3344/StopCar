package com.pc;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.mysql.parkingspacedata;
import com.mysql.statuschange;
import com.status.Status;


//该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。类似Servlet的注解mapping
@ServerEndpoint("/websocket")
public class websocket{
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
		private static int onlineCount = 0;
		
		//concurrent包的线程安全Set，用来存放每个客户端对应的websocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
		private static CopyOnWriteArraySet<websocket> webSocketSet = new CopyOnWriteArraySet<websocket>();
		
		//与某个客户端的连接会话，需要通过它来给客户端发送数据大概打发是地价哦
		private Session session;
/*		*//**
		 * 连接建立成功调用的方法
		 * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
		 *//*
*/		@OnOpen
		public void onOpen(Session session){
			this.session = session;
			webSocketSet.add(this);		//加入set中
			addOnlineCount();			//在线数加1
			System.out.println("是打发有新连接加入！当前在线人数为" + getOnlineCount());
		}


		@OnClose
		public void onClose(){
			webSocketSet.remove(this);	//从set中删除
			subOnlineCount();			//在线数减1		
			System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
		}

		public static void send(String park, String num,String sta){
			String s= 1 + "-" + park + "-" + num + "-" + sta;
			for (websocket item : webSocketSet) {
				try {
					item.sendMessage(s);
					Thread.sleep(1 * 1000);
					Status.t=0;
				} catch (Exception e) {
					e.printStackTrace();
					continue;
				}
			}

		}
/*		public void mysqltest extends Thread{
			public void run(){

			}

		}*/

		
/*		*//**
		 * 收到客户端消息后调用的方法
		 * @param message 客户端发送过来的消息
		 * @param session 可选的参数
		 *//*
*/		@OnMessage
		public void onMessage(String message, Session session) {
			System.out.println("来自客户端的消息:" + message);
			if(message.equals("link?")){
				for (websocket item : webSocketSet) {
					try {
						item.sendMessage("ok");
						Thread.sleep(1 * 1000);
						Status.t=0;
					} catch (Exception e) {
						e.printStackTrace();
						continue;
					}
				}
			}

//			Queue queue=new Queue();
//			queue.enqueue(message);

			if (message.contains("-") && message.length() >= 3) {
				String[] temp = null;
				try {
					temp = message.split("-");
				} catch (Exception e) {
					e.printStackTrace();
				}

				if (temp != null) {
					String sendData = null;
					if (Integer.parseInt(temp[0]) == 1) {
						// temp=1-1-2 
						// 查询库的操作

						parkingspacedata Parkingspacedata=new parkingspacedata();
						Parkingspacedata.PcGetStatus("select * from parking_space where parking_id= "+temp[1]+" and number= "+temp[2]);

						String checkResult=null; // 1代表车位可以使用，0代表车位不可以使用
						checkResult = Parkingspacedata.pcdata;
						sendData = 2 + "-" + temp[1] +"-"+ temp[2] + "-"+checkResult;
						//Parkingspacedata.pcdata="3";
					} else if (Integer.parseInt(temp[0]) == 2) {
						// temp= 2-1-2-1
						// 更改数据库车位的存储状态操作
						statuschange statuschange = new statuschange();
						boolean result=statuschange.status("update parking_space set status="+temp[3]+" where parking_id="
								+temp[1]+" and number="+temp[2]);
						System.out.println("设置" + temp[1] + "-" + temp[2] + "状态"
								+ temp[3] + "成功");
						if(result==true){
							sendData="change success";
						}else {
							sendData="change fail";
						}
					}

					for (websocket item : webSocketSet) {
						try {
							//sendData="1-1-2-1";
							System.out.println("send data ---->" + sendData);
							item.sendMessage(sendData);
							Thread.sleep(1 * 1000);
						} catch (Exception e) {
							e.printStackTrace();
							continue;
						}
					}
				}

			}

		}
		
/*		*//**
		 * 发生错误时调用
		 * @param session
		 * @param error
		 *//*
*/		@OnError
		public void onError(Session session, Throwable error){
			System.out.println("发生错误");
			error.printStackTrace();
		}
		
/*		*//**
		 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
		 * @param message
		 * @throws IOException
		 *//*
*/		public void sendMessage(String message) throws IOException{
			this.session.getBasicRemote().sendText(message);
			//this.session.getAsyncRemote().sendText(message);
		}
		public static synchronized int getOnlineCount() {
			return onlineCount;
		}

		public static synchronized void addOnlineCount() {
			websocket.onlineCount++;
		}
		
		public static synchronized void subOnlineCount() {
			websocket.onlineCount--;
		}
}
