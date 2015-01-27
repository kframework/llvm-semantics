import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

// Copyright (c) 2015 K Team. All Rights Reserved.
public class DeleteLLVMComments {

    /**
     * @author LiyiLi
     * This java code takes in a LLVM program and
     * eliminates the LLVM comments in the program, then
     * outputs the modified LLVM program
     * to a temporary LLVM file.
     */
    public static void main(String[] args) {
        String fileName = args[0];
        File llvmFile = new File(fileName);
        if(llvmFile.isFile()){
            try {
                Scanner scanner = new Scanner(llvmFile);
                PrintWriter newLlvmProgam = new PrintWriter("llvmtemp.ll");
                /**
                 * Declare a variable to indicate whether or
                 * not the current scanning character is inside
                 * a double quote block.
                 */
                boolean isInQuoteBlock = false;
                
                while(scanner.hasNextLine()){
                    String currentLine = scanner.nextLine();
                    String newPrintLine = "";
                    for(int i = 0; i < currentLine.length(); ++i){
                        if(currentLine.charAt(i) == '"'){
                            isInQuoteBlock = isInQuoteBlock != true;
                            newPrintLine += currentLine.charAt(i);
                        } else {
                            if(!isInQuoteBlock
                                    && currentLine.charAt(i) == ';'){
                                break;
                            } else {
                                newPrintLine += currentLine.charAt(i);
                            }
                        }
                    } //end of for loop
                    newLlvmProgam.println(newPrintLine);
                } // end of while loop
                newLlvmProgam.close();
                scanner.close();
            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } 
        }
    }
}
