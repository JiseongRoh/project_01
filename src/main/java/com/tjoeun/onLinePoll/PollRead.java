package com.tjoeun.onLinePoll;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class PollRead {

	public static ArrayList<String> pollRead(String filepath) {
		
		ArrayList<String> poll = null;
		Scanner scanner = null;
		
		try {
			scanner = new Scanner(new File(filepath));
			poll = new ArrayList<String>();
			while (scanner.hasNextLine()) {
				String str = scanner.nextLine().trim();
				if (str.length() > 0) {
					poll.add(str);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("디스크에 파일이 존재하지 않습니다.");
		}
		
		return poll;
		
	}
	
}