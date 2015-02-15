import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// Copyright (c) 2015 K Team. All Rights Reserved.
public class DeleteLLVMComments {

    /**
     * @author LiyiLi
     * This Java program that an LLVM program as input and eliminates
     * all the comments from it.  The resulting uncommented LLVM program
     * is saved to a temporary string.
     * This step is needed due to a limitation of the current K parser,
     * which cannot parse LLVM comments, and it
     * will be eliminated as soon as the K parser is fixed.
     */
    public static void main(String[] args) {
        
    	if(args.length == 0){
    		System.err.println("Haven't specify the input program.");
        }
        String fileName = args[0];
        File llvmFile = new File(fileName);
        String newPrintLine = "";
        if(llvmFile.isFile()){//if input file exists.
            try {
                Scanner scanner = new Scanner(llvmFile);
                /**
                 * Declare a variable to indicate whether or
                 * not the current scanning character is inside
                 * a double quote block.
                 */
                boolean isInQuoteBlock = false;
                
                while(scanner.hasNextLine()){
                    String currentLine = scanner.nextLine();
                    for(int i = 0; i < currentLine.length(); ++i){
                    	char currentChar = '\0';
                        if(currentLine.charAt(i) == '"'){
                            isInQuoteBlock = ! isInQuoteBlock;
                            currentChar = currentLine.charAt(i);
                        } else {
                            if(!isInQuoteBlock
                                    && currentLine.charAt(i) == ';'){
                                break;
                            } else {
                            	currentChar = currentLine.charAt(i);
                            }
                        }
                        newPrintLine += currentChar;
                    } //end of for loop
                    newPrintLine += "\n";
                } // end of while loop
                scanner.close();
            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        else {//if input file doesn't exist.
              System.err.println("Input test file " +
              		"is not a file or does not exist.");
        }
		System.out.println(newPrintLine);
    }
}
