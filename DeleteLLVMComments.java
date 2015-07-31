import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Scanner;

public class DeleteLLVMComments {
    
    public static boolean isSpecifiedChar(char theChar) {
        if (theChar == ')' || theChar == ']' || theChar == '}' || theChar == ' ') {
            return true;
        }
        return false;
    }
    
    public static boolean isCharC(char theChar) {
        if (theChar == 'c') 
            return true;
        return false;
    }
    
    public static String getCStringContent(String theLine, int theLineIndex) {
        String cStringContent = "";
        for(int i = theLineIndex; i < theLine.length(); ++i) {
            cStringContent += theLine.charAt(i);
            if(theLineIndex == '\"') {
                cStringContent += theLine.charAt(i);
                break;
            }
        }
        return cStringContent;
    }
    
    public static boolean isHexCharacter(char theChar) {
        if ( theChar == '0'
                || theChar == '1'
                || theChar == '2'
                || theChar == '3'
                || theChar == '4'
                || theChar == '5'
                || theChar == '6'
                || theChar == '7'
                || theChar == '8'
                || theChar == '9'
                || theChar == 'a'
                || theChar == 'b'
                || theChar == 'c'
                || theChar == 'd'
                || theChar == 'e'
                || theChar == 'f'
                || theChar == 'A'
                || theChar == 'B'
                || theChar == 'C'
                || theChar == 'D'
                || theChar == 'E'
                || theChar == 'F') {
            return true;
        }
        return false;
        
    }
    
    /**
     * @author LiyiLi
     * This Java program takes an LLVM program as input and eliminates
     * all the comments from it.  The resulting uncommented LLVM program
     * is saved to a temporary string.
     * This step is needed due to a limitation of the current K parser,
     * which cannot parse LLVM comments, and it
     * will be eliminated as soon as the K parser is fixed.
     * @throws InterruptedException 
     */
    public static void main(String[] args) throws InterruptedException {
        
        //if(args.length == 0){
        //    System.err.println("Haven't specified the input program.");
        //}
        String fileName = "printNum.ll";
        File llvmFile = new File(fileName);
        String newLine = "";
        if(llvmFile.isFile()){//if input file exists.
            try {
                Scanner scanner = new Scanner(llvmFile);
                /**
                 * Declare a variable to indicate whether or
                 * not the current scanning character is inside
                 * a double quote block.
                 * This algorithm works because users cannot write
                 * \" inside a string (starting by " and ending by ") in LLVM.
                 * That is why we can only use a variable (isInQuoteBlock) to keep track of
                 * whether or not the current character is located inside
                 * a string block of a LLVM program.
                 */
                boolean isInQuoteBlock = false;
                
                while(scanner.hasNextLine()){
                    String currentLine = scanner.nextLine();
                    
                    for(int i = 0; i < currentLine.length(); ++i){
                        if(isSpecifiedChar(currentLine.charAt(i))){                                           //reach to a specified character, ),],}
                            newLine += currentLine.charAt(i);
                            if(i+1 < currentLine.length()){                                                   //checker index 
                                if(isCharC(currentLine.charAt(i+1))){                                         //
                                    i++;
                                    newLine += currentLine.charAt(i);
                                    for(int j = i + 1; j < currentLine.length(); ++j){
                                        if(currentLine.charAt(j) == ' '){
                                            i++;
                                            newLine += currentLine.charAt(j);
                                        } else {
                                            break;
                                        }
                                    }
                                    if(i+1 < currentLine.length()){
                                        if(currentLine.charAt(i+1) == '\"'){
                                            i++;
                                            newLine += currentLine.charAt(i);
                                            String content = getCStringContent(currentLine, i + 1);
                                            for(int j = 0; j < content.length(); ++j){
                                                newLine += content.charAt(j);
                                                i++;
                                                if(content.charAt(j) == '\\'){
                                                    if(j+1 < content.length()){
                                                        if(isHexCharacter(content.charAt(j+1))){
                                                            newLine += 'x';
                                                        }
                                                    }
                                                }
                                            }
                                        } else {
                                            continue;
                                        }
                                    } else {
                                        break;
                                    }
                                } else {
                                    continue;
                                }
                            } else {                                                                          //move the index from the specified character to the next, reach to the end of the line 
                                break;
                            }
                        } else {                                                                              //reach to a non-specified-character, then, just add it.
                            char currentChar = currentLine.charAt(i);
                            if(currentChar == '"'){
                                isInQuoteBlock = ! isInQuoteBlock;
                            } else if(!isInQuoteBlock
                                        && currentChar == ';'){
                                break;
                            }
                            newLine += currentChar;
                        }
                    }
                    newLine += "\n";
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
        File output = new File(fileName+".temp");
        PrintWriter printWriter = null;
        try {
            printWriter = new PrintWriter(output);
        } catch (FileNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        printWriter.print(newLine);
        printWriter.close();
        Process p = null;
        try {
            p = Runtime.getRuntime().exec(new String[]{"/bin/sh", "-c", "\"kast "+fileName+".temp\""});
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        p.waitFor();
     
        BufferedReader reader = 
             new BufferedReader(new InputStreamReader(p.getInputStream()));
     
        String line = "";            
        try {
            while ((line = reader.readLine())!= null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    
}
