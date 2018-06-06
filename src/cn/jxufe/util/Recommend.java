package cn.jxufe.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.User;

import java.util.Map.Entry;

public class Recommend {
	public static List<Integer> tuijian(List<User> MYusers,User MYuser) {
		int n = 0;
		Map<String, Integer> userItemLength = new HashMap<>();//存储每一个用户对应的不同物品总数  eg: A 3
		Map<String, Set<String>> itemUserCollection = new HashMap<>();//建立物品到用户的倒排表 eg: a A B
		Set<String> items = new HashSet<>();//辅助存储物品集合
		Map<String, Integer> userID = new HashMap<>();//辅助存储每一个用户的用户ID映射
		Map<Integer, String> idUser = new HashMap<>();//辅助存储每一个ID对应的用户映射
		String str = "";
		for(int i = 0; i < MYusers.size() ; i++){//依次处理N个用户 输入数据  以空格间隔
			
			String[] user_item = null;

			Set<Book> books = MYusers.get(i).getBooks();
			for(Book book : books) {
				str += book.getBid()+",";
			}
			
			if(str!="") {
				str = String.valueOf(MYusers.get(i).getUid())+ ","+str;
				System.out.println("str=" + str);
				++n;
				user_item = str.split(",");
				int length = user_item.length;
				System.out.println("length=" + length);
				userItemLength.put(user_item[0],length-1);//eg: A 3
				userID.put(user_item[0], n-1);//用户ID与稀疏矩阵建立对应关系
				idUser.put(n-1, user_item[0]);
				//建立物品--用户倒排表
				for(int j = 1; j < length; j ++){
					if(items.contains(user_item[j])){//如果已经包含对应的物品--用户映射，直接添加对应的用户
						itemUserCollection.get(user_item[j]).add(user_item[0]);
					}else{//否则创建对应物品--用户集合映射
						items.add(user_item[j]);
						itemUserCollection.put(user_item[j], new HashSet<String>());//创建物品--用户倒排关系
						itemUserCollection.get(user_item[j]).add(user_item[0]);
					}
				}
			}
			
			str="";
		}
		
		int[][] sparseMatrix = new int[n][n];//建立用户稀疏矩阵，用于用户相似度计算【相似度矩阵】
	
		System.out.println(itemUserCollection.toString());
		//计算相似度矩阵【稀疏】
		Set<Entry<String, Set<String>>> entrySet = itemUserCollection.entrySet();
		Iterator<Entry<String, Set<String>>> iterator = entrySet.iterator();
		while(iterator.hasNext()){
			Set<String> commonUsers = iterator.next().getValue();
			for (String user_u : commonUsers) {
				for (String user_v : commonUsers) {
					if(user_u.equals(user_v)){
						continue;
					}
					sparseMatrix[userID.get(user_u)][userID.get(user_v)] += 1;//计算用户u与用户v都有正反馈的物品总数
				}
			}
		}
		System.out.println(userItemLength.toString());
		System.out.println("Input the user for recommendation:<eg:A>");
		String recommendUser = String.valueOf(MYuser.getUid());
		System.out.println("recommendUser的用户名"+recommendUser);
		
		System.out.println(userID.get(recommendUser));
		
		System.out.println(userID.toString());
		System.out.println(idUser.toString());
		//计算用户之间的相似度【余弦相似性】
		int recommendUserId = userID.get(recommendUser);
		for (int j = 0;j < sparseMatrix.length; j++) {
				if(j != recommendUserId){
					System.out.println(
							idUser.get(recommendUserId)+"--"+
							idUser.get(j)+"相似度:"+
							sparseMatrix[recommendUserId][j]/Math.sqrt(userItemLength.get(idUser.get(recommendUserId))*userItemLength.get(idUser.get(j))));
				}
		}
		
		List<Integer> list = new ArrayList<>();
		//计算指定用户recommendUser的物品推荐度
		System.out.println(userID.toString());
		System.out.println(idUser.toString());
		System.out.println(sparseMatrix.toString());
		for(String item: items){//遍历每一件物品
			Set<String> users = itemUserCollection.get(item);//得到购买当前物品的所有用户集合
			if(!users.contains(recommendUser)){//如果被推荐用户没有购买当前物品，则进行推荐度计算
				double itemRecommendDegree = 0.0;
				for(String user: users){
					itemRecommendDegree += sparseMatrix[userID.get(recommendUser)][userID.get(user)]/Math.sqrt(userItemLength.get(recommendUser)*userItemLength.get(user));//推荐度计算
				}
				System.out.println("The item "+item+" for "+recommendUser +"'s recommended degree:"+itemRecommendDegree);
				if(itemRecommendDegree >0.5) {
					System.out.println("新增"+item);
					list.add(Integer.parseInt(item));
				}
			}
		}
		return list;
	}
}