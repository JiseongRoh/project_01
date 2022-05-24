package com.tjoeun.onLinePoll;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class PollWrite {

	public static void pollWrite(String filepath, ArrayList<String> poll) {

		PrintWriter printWriter = null;
		
		try {
			printWriter = new PrintWriter(filepath);
			for (String str : poll) {
				printWriter.write(str + "\r\n");
			}
		} catch (FileNotFoundException e) {
			System.out.println("디스크에 파일이 존재하지 않습니다.");
		} finally {
			if (printWriter != null) { printWriter.close();	}
		}
		
	}
}