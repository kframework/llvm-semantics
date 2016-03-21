; ModuleID = './2006-12-11-LoadConstants.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%08x\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"%016llx\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @zz() #0 {
  ret i64 0
}

; Function Attrs: nounwind uwtable
define i64 @zs() #0 {
  ret i64 65535
}

; Function Attrs: nounwind uwtable
define i64 @zu() #0 {
  ret i64 32767
}

; Function Attrs: nounwind uwtable
define i64 @sz() #0 {
  ret i64 4294901760
}

; Function Attrs: nounwind uwtable
define i64 @ss() #0 {
  ret i64 4294967295
}

; Function Attrs: nounwind uwtable
define i64 @su() #0 {
  ret i64 4294934527
}

; Function Attrs: nounwind uwtable
define i64 @uz() #0 {
  ret i64 2147418112
}

; Function Attrs: nounwind uwtable
define i64 @us() #0 {
  ret i64 2147483647
}

; Function Attrs: nounwind uwtable
define i64 @uu() #0 {
  ret i64 2147450879
}

; Function Attrs: nounwind uwtable
define i64 @zzzz() #0 {
  ret i64 0
}

; Function Attrs: nounwind uwtable
define i64 @zzzs() #0 {
  ret i64 65535
}

; Function Attrs: nounwind uwtable
define i64 @zzzu() #0 {
  ret i64 32767
}

; Function Attrs: nounwind uwtable
define i64 @zzsz() #0 {
  ret i64 4294901760
}

; Function Attrs: nounwind uwtable
define i64 @zzss() #0 {
  ret i64 4294967295
}

; Function Attrs: nounwind uwtable
define i64 @zzsu() #0 {
  ret i64 4294934527
}

; Function Attrs: nounwind uwtable
define i64 @zzuz() #0 {
  ret i64 2147418112
}

; Function Attrs: nounwind uwtable
define i64 @zzus() #0 {
  ret i64 2147483647
}

; Function Attrs: nounwind uwtable
define i64 @zzuu() #0 {
  ret i64 2147450879
}

; Function Attrs: nounwind uwtable
define i64 @zszz() #0 {
  ret i64 281470681743360
}

; Function Attrs: nounwind uwtable
define i64 @zszs() #0 {
  ret i64 281470681808895
}

; Function Attrs: nounwind uwtable
define i64 @zszu() #0 {
  ret i64 281470681776127
}

; Function Attrs: nounwind uwtable
define i64 @zssz() #0 {
  ret i64 281474976645120
}

; Function Attrs: nounwind uwtable
define i64 @zsss() #0 {
  ret i64 281474976710655
}

; Function Attrs: nounwind uwtable
define i64 @zssu() #0 {
  ret i64 281474976677887
}

; Function Attrs: nounwind uwtable
define i64 @zsuz() #0 {
  ret i64 281472829161472
}

; Function Attrs: nounwind uwtable
define i64 @zsus() #0 {
  ret i64 281472829227007
}

; Function Attrs: nounwind uwtable
define i64 @zsuu() #0 {
  ret i64 281472829194239
}

; Function Attrs: nounwind uwtable
define i64 @zuzz() #0 {
  ret i64 140733193388032
}

; Function Attrs: nounwind uwtable
define i64 @zuzs() #0 {
  ret i64 140733193453567
}

; Function Attrs: nounwind uwtable
define i64 @zuzu() #0 {
  ret i64 140733193420799
}

; Function Attrs: nounwind uwtable
define i64 @zusz() #0 {
  ret i64 140737488289792
}

; Function Attrs: nounwind uwtable
define i64 @zuss() #0 {
  ret i64 140737488355327
}

; Function Attrs: nounwind uwtable
define i64 @zusu() #0 {
  ret i64 140737488322559
}

; Function Attrs: nounwind uwtable
define i64 @zuuz() #0 {
  ret i64 140735340806144
}

; Function Attrs: nounwind uwtable
define i64 @zuus() #0 {
  ret i64 140735340871679
}

; Function Attrs: nounwind uwtable
define i64 @zuuu() #0 {
  ret i64 140735340838911
}

; Function Attrs: nounwind uwtable
define i64 @szzz() #0 {
  ret i64 -281474976710656
}

; Function Attrs: nounwind uwtable
define i64 @szzs() #0 {
  ret i64 -281474976645121
}

; Function Attrs: nounwind uwtable
define i64 @szzu() #0 {
  ret i64 -281474976677889
}

; Function Attrs: nounwind uwtable
define i64 @szsz() #0 {
  ret i64 -281470681808896
}

; Function Attrs: nounwind uwtable
define i64 @szss() #0 {
  ret i64 -281470681743361
}

; Function Attrs: nounwind uwtable
define i64 @szsu() #0 {
  ret i64 -281470681776129
}

; Function Attrs: nounwind uwtable
define i64 @szuz() #0 {
  ret i64 -281472829292544
}

; Function Attrs: nounwind uwtable
define i64 @szus() #0 {
  ret i64 -281472829227009
}

; Function Attrs: nounwind uwtable
define i64 @szuu() #0 {
  ret i64 -281472829259777
}

; Function Attrs: nounwind uwtable
define i64 @sszz() #0 {
  ret i64 -4294967296
}

; Function Attrs: nounwind uwtable
define i64 @sszs() #0 {
  ret i64 -4294901761
}

; Function Attrs: nounwind uwtable
define i64 @sszu() #0 {
  ret i64 -4294934529
}

; Function Attrs: nounwind uwtable
define i64 @sssz() #0 {
  ret i64 -65536
}

; Function Attrs: nounwind uwtable
define i64 @ssss() #0 {
  ret i64 -1
}

; Function Attrs: nounwind uwtable
define i64 @sssu() #0 {
  ret i64 -32769
}

; Function Attrs: nounwind uwtable
define i64 @ssuz() #0 {
  ret i64 -2147549184
}

; Function Attrs: nounwind uwtable
define i64 @ssus() #0 {
  ret i64 -2147483649
}

; Function Attrs: nounwind uwtable
define i64 @ssuu() #0 {
  ret i64 -2147516417
}

; Function Attrs: nounwind uwtable
define i64 @suzz() #0 {
  ret i64 -140741783322624
}

; Function Attrs: nounwind uwtable
define i64 @suzs() #0 {
  ret i64 -140741783257089
}

; Function Attrs: nounwind uwtable
define i64 @suzu() #0 {
  ret i64 -140741783289857
}

; Function Attrs: nounwind uwtable
define i64 @susz() #0 {
  ret i64 -140737488420864
}

; Function Attrs: nounwind uwtable
define i64 @suss() #0 {
  ret i64 -140737488355329
}

; Function Attrs: nounwind uwtable
define i64 @susu() #0 {
  ret i64 -140737488388097
}

; Function Attrs: nounwind uwtable
define i64 @suuz() #0 {
  ret i64 -140739635904512
}

; Function Attrs: nounwind uwtable
define i64 @suus() #0 {
  ret i64 -140739635838977
}

; Function Attrs: nounwind uwtable
define i64 @suuu() #0 {
  ret i64 -140739635871745
}

; Function Attrs: nounwind uwtable
define i64 @uzzz() #0 {
  ret i64 9223090561878065152
}

; Function Attrs: nounwind uwtable
define i64 @uzzs() #0 {
  ret i64 9223090561878130687
}

; Function Attrs: nounwind uwtable
define i64 @uzzu() #0 {
  ret i64 9223090561878097919
}

; Function Attrs: nounwind uwtable
define i64 @uzsz() #0 {
  ret i64 9223090566172966912
}

; Function Attrs: nounwind uwtable
define i64 @uzss() #0 {
  ret i64 9223090566173032447
}

; Function Attrs: nounwind uwtable
define i64 @uzsu() #0 {
  ret i64 9223090566172999679
}

; Function Attrs: nounwind uwtable
define i64 @uzuz() #0 {
  ret i64 9223090564025483264
}

; Function Attrs: nounwind uwtable
define i64 @uzus() #0 {
  ret i64 9223090564025548799
}

; Function Attrs: nounwind uwtable
define i64 @uzuu() #0 {
  ret i64 9223090564025516031
}

; Function Attrs: nounwind uwtable
define i64 @uszz() #0 {
  ret i64 9223372032559808512
}

; Function Attrs: nounwind uwtable
define i64 @uszs() #0 {
  ret i64 9223372032559874047
}

; Function Attrs: nounwind uwtable
define i64 @uszu() #0 {
  ret i64 9223372032559841279
}

; Function Attrs: nounwind uwtable
define i64 @ussz() #0 {
  ret i64 9223372036854710272
}

; Function Attrs: nounwind uwtable
define i64 @usss() #0 {
  ret i64 9223372036854775807
}

; Function Attrs: nounwind uwtable
define i64 @ussu() #0 {
  ret i64 9223372036854743039
}

; Function Attrs: nounwind uwtable
define i64 @usuz() #0 {
  ret i64 9223372034707226624
}

; Function Attrs: nounwind uwtable
define i64 @usus() #0 {
  ret i64 9223372034707292159
}

; Function Attrs: nounwind uwtable
define i64 @usuu() #0 {
  ret i64 9223372034707259391
}

; Function Attrs: nounwind uwtable
define i64 @uuzz() #0 {
  ret i64 9223231295071453184
}

; Function Attrs: nounwind uwtable
define i64 @uuzs() #0 {
  ret i64 9223231295071518719
}

; Function Attrs: nounwind uwtable
define i64 @uuzu() #0 {
  ret i64 9223231295071485951
}

; Function Attrs: nounwind uwtable
define i64 @uusz() #0 {
  ret i64 9223231299366354944
}

; Function Attrs: nounwind uwtable
define i64 @uuss() #0 {
  ret i64 9223231299366420479
}

; Function Attrs: nounwind uwtable
define i64 @uusu() #0 {
  ret i64 9223231299366387711
}

; Function Attrs: nounwind uwtable
define i64 @uuuz() #0 {
  ret i64 9223231297218871296
}

; Function Attrs: nounwind uwtable
define i64 @uuus() #0 {
  ret i64 9223231297218936831
}

; Function Attrs: nounwind uwtable
define i64 @uuuu() #0 {
  ret i64 9223231297218904063
}

; Function Attrs: nounwind uwtable
define i64 @bit00() #0 {
  ret i64 1
}

; Function Attrs: nounwind uwtable
define i64 @bit01() #0 {
  ret i64 2
}

; Function Attrs: nounwind uwtable
define i64 @bit02() #0 {
  ret i64 4
}

; Function Attrs: nounwind uwtable
define i64 @bit03() #0 {
  ret i64 8
}

; Function Attrs: nounwind uwtable
define i64 @bit04() #0 {
  ret i64 16
}

; Function Attrs: nounwind uwtable
define i64 @bit05() #0 {
  ret i64 32
}

; Function Attrs: nounwind uwtable
define i64 @bit06() #0 {
  ret i64 64
}

; Function Attrs: nounwind uwtable
define i64 @bit07() #0 {
  ret i64 128
}

; Function Attrs: nounwind uwtable
define i64 @bit08() #0 {
  ret i64 256
}

; Function Attrs: nounwind uwtable
define i64 @bit09() #0 {
  ret i64 512
}

; Function Attrs: nounwind uwtable
define i64 @bit10() #0 {
  ret i64 1024
}

; Function Attrs: nounwind uwtable
define i64 @bit11() #0 {
  ret i64 2048
}

; Function Attrs: nounwind uwtable
define i64 @bit12() #0 {
  ret i64 4096
}

; Function Attrs: nounwind uwtable
define i64 @bit13() #0 {
  ret i64 8192
}

; Function Attrs: nounwind uwtable
define i64 @bit14() #0 {
  ret i64 16384
}

; Function Attrs: nounwind uwtable
define i64 @bit15() #0 {
  ret i64 32768
}

; Function Attrs: nounwind uwtable
define i64 @bit16() #0 {
  ret i64 65536
}

; Function Attrs: nounwind uwtable
define i64 @bit17() #0 {
  ret i64 131072
}

; Function Attrs: nounwind uwtable
define i64 @bit18() #0 {
  ret i64 262144
}

; Function Attrs: nounwind uwtable
define i64 @bit19() #0 {
  ret i64 524288
}

; Function Attrs: nounwind uwtable
define i64 @bit20() #0 {
  ret i64 1048576
}

; Function Attrs: nounwind uwtable
define i64 @bit21() #0 {
  ret i64 2097152
}

; Function Attrs: nounwind uwtable
define i64 @bit22() #0 {
  ret i64 4194304
}

; Function Attrs: nounwind uwtable
define i64 @bit23() #0 {
  ret i64 8388608
}

; Function Attrs: nounwind uwtable
define i64 @bit24() #0 {
  ret i64 16777216
}

; Function Attrs: nounwind uwtable
define i64 @bit25() #0 {
  ret i64 33554432
}

; Function Attrs: nounwind uwtable
define i64 @bit26() #0 {
  ret i64 67108864
}

; Function Attrs: nounwind uwtable
define i64 @bit27() #0 {
  ret i64 134217728
}

; Function Attrs: nounwind uwtable
define i64 @bit28() #0 {
  ret i64 268435456
}

; Function Attrs: nounwind uwtable
define i64 @bit29() #0 {
  ret i64 536870912
}

; Function Attrs: nounwind uwtable
define i64 @bit30() #0 {
  ret i64 1073741824
}

; Function Attrs: nounwind uwtable
define i64 @bit31() #0 {
  ret i64 2147483648
}

; Function Attrs: nounwind uwtable
define i64 @bit32() #0 {
  ret i64 4294967296
}

; Function Attrs: nounwind uwtable
define i64 @bit33() #0 {
  ret i64 8589934592
}

; Function Attrs: nounwind uwtable
define i64 @bit34() #0 {
  ret i64 17179869184
}

; Function Attrs: nounwind uwtable
define i64 @bit35() #0 {
  ret i64 34359738368
}

; Function Attrs: nounwind uwtable
define i64 @bit36() #0 {
  ret i64 68719476736
}

; Function Attrs: nounwind uwtable
define i64 @bit37() #0 {
  ret i64 137438953472
}

; Function Attrs: nounwind uwtable
define i64 @bit38() #0 {
  ret i64 274877906944
}

; Function Attrs: nounwind uwtable
define i64 @bit39() #0 {
  ret i64 549755813888
}

; Function Attrs: nounwind uwtable
define i64 @bit40() #0 {
  ret i64 1099511627776
}

; Function Attrs: nounwind uwtable
define i64 @bit41() #0 {
  ret i64 2199023255552
}

; Function Attrs: nounwind uwtable
define i64 @bit42() #0 {
  ret i64 4398046511104
}

; Function Attrs: nounwind uwtable
define i64 @bit43() #0 {
  ret i64 8796093022208
}

; Function Attrs: nounwind uwtable
define i64 @bit44() #0 {
  ret i64 17592186044416
}

; Function Attrs: nounwind uwtable
define i64 @bit45() #0 {
  ret i64 35184372088832
}

; Function Attrs: nounwind uwtable
define i64 @bit46() #0 {
  ret i64 70368744177664
}

; Function Attrs: nounwind uwtable
define i64 @bit47() #0 {
  ret i64 140737488355328
}

; Function Attrs: nounwind uwtable
define i64 @bit48() #0 {
  ret i64 281474976710656
}

; Function Attrs: nounwind uwtable
define i64 @bit49() #0 {
  ret i64 562949953421312
}

; Function Attrs: nounwind uwtable
define i64 @bit50() #0 {
  ret i64 1125899906842624
}

; Function Attrs: nounwind uwtable
define i64 @bit51() #0 {
  ret i64 2251799813685248
}

; Function Attrs: nounwind uwtable
define i64 @bit52() #0 {
  ret i64 4503599627370496
}

; Function Attrs: nounwind uwtable
define i64 @bit53() #0 {
  ret i64 9007199254740992
}

; Function Attrs: nounwind uwtable
define i64 @bit54() #0 {
  ret i64 18014398509481984
}

; Function Attrs: nounwind uwtable
define i64 @bit55() #0 {
  ret i64 36028797018963968
}

; Function Attrs: nounwind uwtable
define i64 @bit56() #0 {
  ret i64 72057594037927936
}

; Function Attrs: nounwind uwtable
define i64 @bit57() #0 {
  ret i64 144115188075855872
}

; Function Attrs: nounwind uwtable
define i64 @bit58() #0 {
  ret i64 288230376151711744
}

; Function Attrs: nounwind uwtable
define i64 @bit59() #0 {
  ret i64 576460752303423488
}

; Function Attrs: nounwind uwtable
define i64 @bit60() #0 {
  ret i64 1152921504606846976
}

; Function Attrs: nounwind uwtable
define i64 @bit61() #0 {
  ret i64 2305843009213693952
}

; Function Attrs: nounwind uwtable
define i64 @bit62() #0 {
  ret i64 4611686018427387904
}

; Function Attrs: nounwind uwtable
define i64 @bit63() #0 {
  ret i64 -9223372036854775808
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @zz()
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %4)
  %6 = call i64 @zs()
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %6)
  %8 = call i64 @zu()
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %8)
  %10 = call i64 @sz()
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %10)
  %12 = call i64 @ss()
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %12)
  %14 = call i64 @su()
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %14)
  %16 = call i64 @uz()
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %16)
  %18 = call i64 @us()
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %18)
  %20 = call i64 @uu()
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %20)
  %22 = call i64 @zzzz()
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %22)
  %24 = call i64 @zzzs()
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %24)
  %26 = call i64 @zzzu()
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %26)
  %28 = call i64 @zzsz()
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %28)
  %30 = call i64 @zzss()
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %30)
  %32 = call i64 @zzsu()
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %32)
  %34 = call i64 @zzuz()
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %34)
  %36 = call i64 @zzus()
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %36)
  %38 = call i64 @zzuu()
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %38)
  %40 = call i64 @zszz()
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %40)
  %42 = call i64 @zszs()
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %42)
  %44 = call i64 @zszu()
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %44)
  %46 = call i64 @zssz()
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %46)
  %48 = call i64 @zsss()
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %48)
  %50 = call i64 @zssu()
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %50)
  %52 = call i64 @zsuz()
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %52)
  %54 = call i64 @zsus()
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %54)
  %56 = call i64 @zsuu()
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %56)
  %58 = call i64 @zuzz()
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %58)
  %60 = call i64 @zuzs()
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %60)
  %62 = call i64 @zuzu()
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %62)
  %64 = call i64 @zusz()
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %64)
  %66 = call i64 @zuss()
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %66)
  %68 = call i64 @zusu()
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %68)
  %70 = call i64 @zuuz()
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %70)
  %72 = call i64 @zuus()
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %72)
  %74 = call i64 @zuuu()
  %75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %74)
  %76 = call i64 @szzz()
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %76)
  %78 = call i64 @szzs()
  %79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %78)
  %80 = call i64 @szzu()
  %81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %80)
  %82 = call i64 @szsz()
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %82)
  %84 = call i64 @szss()
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %84)
  %86 = call i64 @szsu()
  %87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %86)
  %88 = call i64 @szuz()
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %88)
  %90 = call i64 @szus()
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %90)
  %92 = call i64 @szuu()
  %93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %92)
  %94 = call i64 @sszz()
  %95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %94)
  %96 = call i64 @sszs()
  %97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %96)
  %98 = call i64 @sszu()
  %99 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %98)
  %100 = call i64 @sssz()
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %100)
  %102 = call i64 @ssss()
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %102)
  %104 = call i64 @sssu()
  %105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %104)
  %106 = call i64 @ssuz()
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %106)
  %108 = call i64 @ssus()
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %108)
  %110 = call i64 @ssuu()
  %111 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %110)
  %112 = call i64 @suzz()
  %113 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %112)
  %114 = call i64 @suzs()
  %115 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %114)
  %116 = call i64 @suzu()
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %116)
  %118 = call i64 @susz()
  %119 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %118)
  %120 = call i64 @suss()
  %121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %120)
  %122 = call i64 @susu()
  %123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %122)
  %124 = call i64 @suuz()
  %125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %124)
  %126 = call i64 @suus()
  %127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %126)
  %128 = call i64 @suuu()
  %129 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %128)
  %130 = call i64 @uzzz()
  %131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %130)
  %132 = call i64 @uzzs()
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %132)
  %134 = call i64 @uzzu()
  %135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %134)
  %136 = call i64 @uzsz()
  %137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %136)
  %138 = call i64 @uzss()
  %139 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %138)
  %140 = call i64 @uzsu()
  %141 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %140)
  %142 = call i64 @uzuz()
  %143 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %142)
  %144 = call i64 @uzus()
  %145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %144)
  %146 = call i64 @uzuu()
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %146)
  %148 = call i64 @uszz()
  %149 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %148)
  %150 = call i64 @uszs()
  %151 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %150)
  %152 = call i64 @uszu()
  %153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %152)
  %154 = call i64 @ussz()
  %155 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %154)
  %156 = call i64 @usss()
  %157 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %156)
  %158 = call i64 @ussu()
  %159 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %158)
  %160 = call i64 @usuz()
  %161 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %160)
  %162 = call i64 @usus()
  %163 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %162)
  %164 = call i64 @usuu()
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %164)
  %166 = call i64 @uuzz()
  %167 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %166)
  %168 = call i64 @uuzs()
  %169 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %168)
  %170 = call i64 @uuzu()
  %171 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %170)
  %172 = call i64 @uusz()
  %173 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %172)
  %174 = call i64 @uuss()
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %174)
  %176 = call i64 @uusu()
  %177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %176)
  %178 = call i64 @uuuz()
  %179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %178)
  %180 = call i64 @uuus()
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %180)
  %182 = call i64 @uuuu()
  %183 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %182)
  %184 = call i64 @bit00()
  %185 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %184)
  %186 = call i64 @bit01()
  %187 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %186)
  %188 = call i64 @bit02()
  %189 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %188)
  %190 = call i64 @bit03()
  %191 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %190)
  %192 = call i64 @bit04()
  %193 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %192)
  %194 = call i64 @bit05()
  %195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %194)
  %196 = call i64 @bit06()
  %197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %196)
  %198 = call i64 @bit07()
  %199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %198)
  %200 = call i64 @bit08()
  %201 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %200)
  %202 = call i64 @bit09()
  %203 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %202)
  %204 = call i64 @bit10()
  %205 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %204)
  %206 = call i64 @bit11()
  %207 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %206)
  %208 = call i64 @bit12()
  %209 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %208)
  %210 = call i64 @bit13()
  %211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %210)
  %212 = call i64 @bit14()
  %213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %212)
  %214 = call i64 @bit15()
  %215 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %214)
  %216 = call i64 @bit16()
  %217 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %216)
  %218 = call i64 @bit17()
  %219 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %218)
  %220 = call i64 @bit18()
  %221 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %220)
  %222 = call i64 @bit19()
  %223 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %222)
  %224 = call i64 @bit20()
  %225 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %224)
  %226 = call i64 @bit21()
  %227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %226)
  %228 = call i64 @bit22()
  %229 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %228)
  %230 = call i64 @bit23()
  %231 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %230)
  %232 = call i64 @bit24()
  %233 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %232)
  %234 = call i64 @bit25()
  %235 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %234)
  %236 = call i64 @bit26()
  %237 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %236)
  %238 = call i64 @bit27()
  %239 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %238)
  %240 = call i64 @bit28()
  %241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %240)
  %242 = call i64 @bit29()
  %243 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %242)
  %244 = call i64 @bit30()
  %245 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %244)
  %246 = call i64 @bit31()
  %247 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %246)
  %248 = call i64 @bit32()
  %249 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %248)
  %250 = call i64 @bit33()
  %251 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %250)
  %252 = call i64 @bit34()
  %253 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %252)
  %254 = call i64 @bit35()
  %255 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %254)
  %256 = call i64 @bit36()
  %257 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %256)
  %258 = call i64 @bit37()
  %259 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %258)
  %260 = call i64 @bit38()
  %261 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %260)
  %262 = call i64 @bit39()
  %263 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %262)
  %264 = call i64 @bit40()
  %265 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %264)
  %266 = call i64 @bit41()
  %267 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %266)
  %268 = call i64 @bit42()
  %269 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %268)
  %270 = call i64 @bit43()
  %271 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %270)
  %272 = call i64 @bit44()
  %273 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %272)
  %274 = call i64 @bit45()
  %275 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %274)
  %276 = call i64 @bit46()
  %277 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %276)
  %278 = call i64 @bit47()
  %279 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %278)
  %280 = call i64 @bit48()
  %281 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %280)
  %282 = call i64 @bit49()
  %283 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %282)
  %284 = call i64 @bit50()
  %285 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %284)
  %286 = call i64 @bit51()
  %287 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %286)
  %288 = call i64 @bit52()
  %289 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %288)
  %290 = call i64 @bit53()
  %291 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %290)
  %292 = call i64 @bit54()
  %293 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %292)
  %294 = call i64 @bit55()
  %295 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %294)
  %296 = call i64 @bit56()
  %297 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %296)
  %298 = call i64 @bit57()
  %299 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %298)
  %300 = call i64 @bit58()
  %301 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %300)
  %302 = call i64 @bit59()
  %303 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %302)
  %304 = call i64 @bit60()
  %305 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %304)
  %306 = call i64 @bit61()
  %307 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %306)
  %308 = call i64 @bit62()
  %309 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %308)
  %310 = call i64 @bit63()
  %311 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 %310)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
