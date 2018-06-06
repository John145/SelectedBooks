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
		Map<String, Integer> userItemLength = new HashMap<>();//�洢ÿһ���û���Ӧ�Ĳ�ͬ��Ʒ����  eg: A 3
		Map<String, Set<String>> itemUserCollection = new HashMap<>();//������Ʒ���û��ĵ��ű� eg: a A B
		Set<String> items = new HashSet<>();//�����洢��Ʒ����
		Map<String, Integer> userID = new HashMap<>();//�����洢ÿһ���û����û�IDӳ��
		Map<Integer, String> idUser = new HashMap<>();//�����洢ÿһ��ID��Ӧ���û�ӳ��
		String str = "";
		for(int i = 0; i < MYusers.size() ; i++){//���δ���N���û� ��������  �Կո���
			
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
				userID.put(user_item[0], n-1);//�û�ID��ϡ���������Ӧ��ϵ
				idUser.put(n-1, user_item[0]);
				//������Ʒ--�û����ű�
				for(int j = 1; j < length; j ++){
					if(items.contains(user_item[j])){//����Ѿ�������Ӧ����Ʒ--�û�ӳ�䣬ֱ����Ӷ�Ӧ���û�
						itemUserCollection.get(user_item[j]).add(user_item[0]);
					}else{//���򴴽���Ӧ��Ʒ--�û�����ӳ��
						items.add(user_item[j]);
						itemUserCollection.put(user_item[j], new HashSet<String>());//������Ʒ--�û����Ź�ϵ
						itemUserCollection.get(user_item[j]).add(user_item[0]);
					}
				}
			}
			
			str="";
		}
		
		int[][] sparseMatrix = new int[n][n];//�����û�ϡ����������û����ƶȼ��㡾���ƶȾ���
	
		System.out.println(itemUserCollection.toString());
		//�������ƶȾ���ϡ�衿
		Set<Entry<String, Set<String>>> entrySet = itemUserCollection.entrySet();
		Iterator<Entry<String, Set<String>>> iterator = entrySet.iterator();
		while(iterator.hasNext()){
			Set<String> commonUsers = iterator.next().getValue();
			for (String user_u : commonUsers) {
				for (String user_v : commonUsers) {
					if(user_u.equals(user_v)){
						continue;
					}
					sparseMatrix[userID.get(user_u)][userID.get(user_v)] += 1;//�����û�u���û�v��������������Ʒ����
				}
			}
		}
		System.out.println(userItemLength.toString());
		System.out.println("Input the user for recommendation:<eg:A>");
		String recommendUser = String.valueOf(MYuser.getUid());
		System.out.println("recommendUser���û���"+recommendUser);
		
		System.out.println(userID.get(recommendUser));
		
		System.out.println(userID.toString());
		System.out.println(idUser.toString());
		//�����û�֮������ƶȡ����������ԡ�
		int recommendUserId = userID.get(recommendUser);
		for (int j = 0;j < sparseMatrix.length; j++) {
				if(j != recommendUserId){
					System.out.println(
							idUser.get(recommendUserId)+"--"+
							idUser.get(j)+"���ƶ�:"+
							sparseMatrix[recommendUserId][j]/Math.sqrt(userItemLength.get(idUser.get(recommendUserId))*userItemLength.get(idUser.get(j))));
				}
		}
		
		List<Integer> list = new ArrayList<>();
		//����ָ���û�recommendUser����Ʒ�Ƽ���
		System.out.println(userID.toString());
		System.out.println(idUser.toString());
		System.out.println(sparseMatrix.toString());
		for(String item: items){//����ÿһ����Ʒ
			Set<String> users = itemUserCollection.get(item);//�õ�����ǰ��Ʒ�������û�����
			if(!users.contains(recommendUser)){//������Ƽ��û�û�й���ǰ��Ʒ��������Ƽ��ȼ���
				double itemRecommendDegree = 0.0;
				for(String user: users){
					itemRecommendDegree += sparseMatrix[userID.get(recommendUser)][userID.get(user)]/Math.sqrt(userItemLength.get(recommendUser)*userItemLength.get(user));//�Ƽ��ȼ���
				}
				System.out.println("The item "+item+" for "+recommendUser +"'s recommended degree:"+itemRecommendDegree);
				if(itemRecommendDegree >0.5) {
					System.out.println("����"+item);
					list.add(Integer.parseInt(item));
				}
			}
		}
		return list;
	}
}