; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @test1(i8 signext %c, i32 %set) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %set.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i8* %c.addr, align 1
  %conv = sext i8 %tmp to i32
  %and = and i32 %conv, 128
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end8

if.else:                                          ; preds = %entry
  %tmp4 = load i32* %set.addr, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  %tmp9 = load i8* %c.addr, align 1
  %conv10 = sext i8 %tmp9 to i32
  %and11 = and i32 %conv10, 128
  %cmp12 = icmp ne i32 %and11, 0
  br i1 %cmp12, label %if.then14, label %if.else19

if.then14:                                        ; preds = %if.end8
  %tmp15 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.then14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.then14
  br label %if.end24

if.else19:                                        ; preds = %if.end8
  %tmp20 = load i32* %set.addr, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.else19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.else19
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end18
  %tmp25 = load i8* %c.addr, align 1
  %conv26 = sext i8 %tmp25 to i32
  %and27 = and i32 %conv26, 128
  %cmp28 = icmp eq i32 %and27, 128
  br i1 %cmp28, label %if.then30, label %if.else35

if.then30:                                        ; preds = %if.end24
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.then30
  br label %if.end40

if.else35:                                        ; preds = %if.end24
  %tmp36 = load i32* %set.addr, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.else35
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end34
  %tmp41 = load i8* %c.addr, align 1
  %conv42 = sext i8 %tmp41 to i32
  %and43 = and i32 %conv42, 128
  %cmp44 = icmp ne i32 %and43, 128
  br i1 %cmp44, label %if.then46, label %if.else51

if.then46:                                        ; preds = %if.end40
  %tmp47 = load i32* %set.addr, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.then46
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.then46
  br label %if.end56

if.else51:                                        ; preds = %if.end40
  %tmp52 = load i32* %set.addr, align 4
  %tobool53 = icmp ne i32 %tmp52, 0
  br i1 %tobool53, label %if.end55, label %if.then54

if.then54:                                        ; preds = %if.else51
  call void @abort() noreturn nounwind
  unreachable

if.end55:                                         ; preds = %if.else51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end50
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i8 zeroext %c, i32 %set) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %set.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i8* %c.addr, align 1
  %conv = zext i8 %tmp to i32
  %and = and i32 %conv, 128
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end8

if.else:                                          ; preds = %entry
  %tmp4 = load i32* %set.addr, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  %tmp9 = load i8* %c.addr, align 1
  %conv10 = zext i8 %tmp9 to i32
  %and11 = and i32 %conv10, 128
  %cmp12 = icmp ne i32 %and11, 0
  br i1 %cmp12, label %if.then14, label %if.else19

if.then14:                                        ; preds = %if.end8
  %tmp15 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.then14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.then14
  br label %if.end24

if.else19:                                        ; preds = %if.end8
  %tmp20 = load i32* %set.addr, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.else19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.else19
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end18
  %tmp25 = load i8* %c.addr, align 1
  %conv26 = zext i8 %tmp25 to i32
  %and27 = and i32 %conv26, 128
  %cmp28 = icmp eq i32 %and27, 128
  br i1 %cmp28, label %if.then30, label %if.else35

if.then30:                                        ; preds = %if.end24
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.then30
  br label %if.end40

if.else35:                                        ; preds = %if.end24
  %tmp36 = load i32* %set.addr, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.else35
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end34
  %tmp41 = load i8* %c.addr, align 1
  %conv42 = zext i8 %tmp41 to i32
  %and43 = and i32 %conv42, 128
  %cmp44 = icmp ne i32 %and43, 128
  br i1 %cmp44, label %if.then46, label %if.else51

if.then46:                                        ; preds = %if.end40
  %tmp47 = load i32* %set.addr, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.then46
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.then46
  br label %if.end56

if.else51:                                        ; preds = %if.end40
  %tmp52 = load i32* %set.addr, align 4
  %tobool53 = icmp ne i32 %tmp52, 0
  br i1 %tobool53, label %if.end55, label %if.then54

if.then54:                                        ; preds = %if.else51
  call void @abort() noreturn nounwind
  unreachable

if.end55:                                         ; preds = %if.else51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end50
  ret void
}

define void @test3(i16 signext %s, i32 %set) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %set.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i16* %s.addr, align 2
  %conv = sext i16 %tmp to i32
  %and = and i32 %conv, 32768
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end8

if.else:                                          ; preds = %entry
  %tmp4 = load i32* %set.addr, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  %tmp9 = load i16* %s.addr, align 2
  %conv10 = sext i16 %tmp9 to i32
  %and11 = and i32 %conv10, 32768
  %cmp12 = icmp ne i32 %and11, 0
  br i1 %cmp12, label %if.then14, label %if.else19

if.then14:                                        ; preds = %if.end8
  %tmp15 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.then14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.then14
  br label %if.end24

if.else19:                                        ; preds = %if.end8
  %tmp20 = load i32* %set.addr, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.else19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.else19
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end18
  %tmp25 = load i16* %s.addr, align 2
  %conv26 = sext i16 %tmp25 to i32
  %and27 = and i32 %conv26, 32768
  %cmp28 = icmp eq i32 %and27, 32768
  br i1 %cmp28, label %if.then30, label %if.else35

if.then30:                                        ; preds = %if.end24
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.then30
  br label %if.end40

if.else35:                                        ; preds = %if.end24
  %tmp36 = load i32* %set.addr, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.else35
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end34
  %tmp41 = load i16* %s.addr, align 2
  %conv42 = sext i16 %tmp41 to i32
  %and43 = and i32 %conv42, 32768
  %cmp44 = icmp ne i32 %and43, 32768
  br i1 %cmp44, label %if.then46, label %if.else51

if.then46:                                        ; preds = %if.end40
  %tmp47 = load i32* %set.addr, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.then46
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.then46
  br label %if.end56

if.else51:                                        ; preds = %if.end40
  %tmp52 = load i32* %set.addr, align 4
  %tobool53 = icmp ne i32 %tmp52, 0
  br i1 %tobool53, label %if.end55, label %if.then54

if.then54:                                        ; preds = %if.else51
  call void @abort() noreturn nounwind
  unreachable

if.end55:                                         ; preds = %if.else51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end50
  ret void
}

define void @test4(i16 zeroext %s, i32 %set) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %set.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i16* %s.addr, align 2
  %conv = zext i16 %tmp to i32
  %and = and i32 %conv, 32768
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end8

if.else:                                          ; preds = %entry
  %tmp4 = load i32* %set.addr, align 4
  %tobool5 = icmp ne i32 %tmp4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  %tmp9 = load i16* %s.addr, align 2
  %conv10 = zext i16 %tmp9 to i32
  %and11 = and i32 %conv10, 32768
  %cmp12 = icmp ne i32 %and11, 0
  br i1 %cmp12, label %if.then14, label %if.else19

if.then14:                                        ; preds = %if.end8
  %tmp15 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %tmp15, 0
  br i1 %tobool16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.then14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.then14
  br label %if.end24

if.else19:                                        ; preds = %if.end8
  %tmp20 = load i32* %set.addr, align 4
  %tobool21 = icmp ne i32 %tmp20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.else19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.else19
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end18
  %tmp25 = load i16* %s.addr, align 2
  %conv26 = zext i16 %tmp25 to i32
  %and27 = and i32 %conv26, 32768
  %cmp28 = icmp eq i32 %and27, 32768
  br i1 %cmp28, label %if.then30, label %if.else35

if.then30:                                        ; preds = %if.end24
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.then30
  br label %if.end40

if.else35:                                        ; preds = %if.end24
  %tmp36 = load i32* %set.addr, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else35
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.else35
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end34
  %tmp41 = load i16* %s.addr, align 2
  %conv42 = zext i16 %tmp41 to i32
  %and43 = and i32 %conv42, 32768
  %cmp44 = icmp ne i32 %and43, 32768
  br i1 %cmp44, label %if.then46, label %if.else51

if.then46:                                        ; preds = %if.end40
  %tmp47 = load i32* %set.addr, align 4
  %tobool48 = icmp ne i32 %tmp47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.then46
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.then46
  br label %if.end56

if.else51:                                        ; preds = %if.end40
  %tmp52 = load i32* %set.addr, align 4
  %tobool53 = icmp ne i32 %tmp52, 0
  br i1 %tobool53, label %if.end55, label %if.then54

if.then54:                                        ; preds = %if.else51
  call void @abort() noreturn nounwind
  unreachable

if.end55:                                         ; preds = %if.else51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end50
  ret void
}

define void @test5(i32 %i, i32 %set) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %set.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %and = and i32 %tmp, -2147483648
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end7

if.else:                                          ; preds = %entry
  %tmp3 = load i32* %set.addr, align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br i1 %tobool4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %tmp8 = load i32* %i.addr, align 4
  %and9 = and i32 %tmp8, -2147483648
  %cmp10 = icmp ne i32 %and9, 0
  br i1 %cmp10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %if.end7
  %tmp12 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.then11
  br label %if.end21

if.else16:                                        ; preds = %if.end7
  %tmp17 = load i32* %set.addr, align 4
  %tobool18 = icmp ne i32 %tmp17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.else16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end15
  %tmp22 = load i32* %i.addr, align 4
  %and23 = and i32 %tmp22, -2147483648
  %cmp24 = icmp eq i32 %and23, -2147483648
  br i1 %cmp24, label %if.then25, label %if.else30

if.then25:                                        ; preds = %if.end21
  %tmp26 = load i32* %set.addr, align 4
  %tobool27 = icmp ne i32 %tmp26, 0
  br i1 %tobool27, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.then25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then25
  br label %if.end35

if.else30:                                        ; preds = %if.end21
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.else30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end29
  %tmp36 = load i32* %i.addr, align 4
  %and37 = and i32 %tmp36, -2147483648
  %cmp38 = icmp ne i32 %and37, -2147483648
  br i1 %cmp38, label %if.then39, label %if.else44

if.then39:                                        ; preds = %if.end35
  %tmp40 = load i32* %set.addr, align 4
  %tobool41 = icmp ne i32 %tmp40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then39
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.then39
  br label %if.end49

if.else44:                                        ; preds = %if.end35
  %tmp45 = load i32* %set.addr, align 4
  %tobool46 = icmp ne i32 %tmp45, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.else44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.else44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end43
  ret void
}

define void @test6(i32 %i, i32 %set) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %set.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %and = and i32 %tmp, -2147483648
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end7

if.else:                                          ; preds = %entry
  %tmp3 = load i32* %set.addr, align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br i1 %tobool4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %tmp8 = load i32* %i.addr, align 4
  %and9 = and i32 %tmp8, -2147483648
  %cmp10 = icmp ne i32 %and9, 0
  br i1 %cmp10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %if.end7
  %tmp12 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.then11
  br label %if.end21

if.else16:                                        ; preds = %if.end7
  %tmp17 = load i32* %set.addr, align 4
  %tobool18 = icmp ne i32 %tmp17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.else16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end15
  %tmp22 = load i32* %i.addr, align 4
  %and23 = and i32 %tmp22, -2147483648
  %cmp24 = icmp eq i32 %and23, -2147483648
  br i1 %cmp24, label %if.then25, label %if.else30

if.then25:                                        ; preds = %if.end21
  %tmp26 = load i32* %set.addr, align 4
  %tobool27 = icmp ne i32 %tmp26, 0
  br i1 %tobool27, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.then25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then25
  br label %if.end35

if.else30:                                        ; preds = %if.end21
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.else30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end29
  %tmp36 = load i32* %i.addr, align 4
  %and37 = and i32 %tmp36, -2147483648
  %cmp38 = icmp ne i32 %and37, -2147483648
  br i1 %cmp38, label %if.then39, label %if.else44

if.then39:                                        ; preds = %if.end35
  %tmp40 = load i32* %set.addr, align 4
  %tobool41 = icmp ne i32 %tmp40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then39
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.then39
  br label %if.end49

if.else44:                                        ; preds = %if.end35
  %tmp45 = load i32* %set.addr, align 4
  %tobool46 = icmp ne i32 %tmp45, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.else44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.else44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end43
  ret void
}

define void @test7(i64 %l, i32 %set) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %set.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i64* %l.addr, align 8
  %and = and i64 %tmp, -9223372036854775808
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end7

if.else:                                          ; preds = %entry
  %tmp3 = load i32* %set.addr, align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br i1 %tobool4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %tmp8 = load i64* %l.addr, align 8
  %and9 = and i64 %tmp8, -9223372036854775808
  %cmp10 = icmp ne i64 %and9, 0
  br i1 %cmp10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %if.end7
  %tmp12 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.then11
  br label %if.end21

if.else16:                                        ; preds = %if.end7
  %tmp17 = load i32* %set.addr, align 4
  %tobool18 = icmp ne i32 %tmp17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.else16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end15
  %tmp22 = load i64* %l.addr, align 8
  %and23 = and i64 %tmp22, -9223372036854775808
  %cmp24 = icmp eq i64 %and23, -9223372036854775808
  br i1 %cmp24, label %if.then25, label %if.else30

if.then25:                                        ; preds = %if.end21
  %tmp26 = load i32* %set.addr, align 4
  %tobool27 = icmp ne i32 %tmp26, 0
  br i1 %tobool27, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.then25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then25
  br label %if.end35

if.else30:                                        ; preds = %if.end21
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.else30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end29
  %tmp36 = load i64* %l.addr, align 8
  %and37 = and i64 %tmp36, -9223372036854775808
  %cmp38 = icmp ne i64 %and37, -9223372036854775808
  br i1 %cmp38, label %if.then39, label %if.else44

if.then39:                                        ; preds = %if.end35
  %tmp40 = load i32* %set.addr, align 4
  %tobool41 = icmp ne i32 %tmp40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then39
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.then39
  br label %if.end49

if.else44:                                        ; preds = %if.end35
  %tmp45 = load i32* %set.addr, align 4
  %tobool46 = icmp ne i32 %tmp45, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.else44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.else44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end43
  ret void
}

define void @test8(i64 %l, i32 %set) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %set.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %set, i32* %set.addr, align 4
  %tmp = load i64* %l.addr, align 8
  %and = and i64 %tmp, -9223372036854775808
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end7

if.else:                                          ; preds = %entry
  %tmp3 = load i32* %set.addr, align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br i1 %tobool4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %tmp8 = load i64* %l.addr, align 8
  %and9 = and i64 %tmp8, -9223372036854775808
  %cmp10 = icmp ne i64 %and9, 0
  br i1 %cmp10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %if.end7
  %tmp12 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.then11
  br label %if.end21

if.else16:                                        ; preds = %if.end7
  %tmp17 = load i32* %set.addr, align 4
  %tobool18 = icmp ne i32 %tmp17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.else16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end15
  %tmp22 = load i64* %l.addr, align 8
  %and23 = and i64 %tmp22, -9223372036854775808
  %cmp24 = icmp eq i64 %and23, -9223372036854775808
  br i1 %cmp24, label %if.then25, label %if.else30

if.then25:                                        ; preds = %if.end21
  %tmp26 = load i32* %set.addr, align 4
  %tobool27 = icmp ne i32 %tmp26, 0
  br i1 %tobool27, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.then25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.then25
  br label %if.end35

if.else30:                                        ; preds = %if.end21
  %tmp31 = load i32* %set.addr, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.else30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.else30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end29
  %tmp36 = load i64* %l.addr, align 8
  %and37 = and i64 %tmp36, -9223372036854775808
  %cmp38 = icmp ne i64 %and37, -9223372036854775808
  br i1 %cmp38, label %if.then39, label %if.else44

if.then39:                                        ; preds = %if.end35
  %tmp40 = load i32* %set.addr, align 4
  %tobool41 = icmp ne i32 %tmp40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then39
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.then39
  br label %if.end49

if.else44:                                        ; preds = %if.end35
  %tmp45 = load i32* %set.addr, align 4
  %tobool46 = icmp ne i32 %tmp45, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.else44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.else44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end43
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1(i8 signext 0, i32 0)
  call void @test1(i8 signext 127, i32 0)
  call void @test1(i8 signext -128, i32 1)
  call void @test1(i8 signext -1, i32 1)
  call void @test2(i8 zeroext 0, i32 0)
  call void @test2(i8 zeroext 127, i32 0)
  call void @test2(i8 zeroext -128, i32 1)
  call void @test2(i8 zeroext -1, i32 1)
  call void @test3(i16 signext 0, i32 0)
  call void @test3(i16 signext 32767, i32 0)
  call void @test3(i16 signext -32768, i32 1)
  call void @test3(i16 signext -1, i32 1)
  call void @test4(i16 zeroext 0, i32 0)
  call void @test4(i16 zeroext 32767, i32 0)
  call void @test4(i16 zeroext -32768, i32 1)
  call void @test4(i16 zeroext -1, i32 1)
  call void @test5(i32 0, i32 0)
  call void @test5(i32 2147483647, i32 0)
  call void @test5(i32 -2147483648, i32 1)
  call void @test5(i32 -1, i32 1)
  call void @test6(i32 0, i32 0)
  call void @test6(i32 2147483647, i32 0)
  call void @test6(i32 -2147483648, i32 1)
  call void @test6(i32 -1, i32 1)
  call void @test7(i64 0, i32 0)
  call void @test7(i64 9223372036854775807, i32 0)
  call void @test7(i64 -9223372036854775808, i32 1)
  call void @test7(i64 -1, i32 1)
  call void @test8(i64 0, i32 0)
  call void @test8(i64 9223372036854775807, i32 0)
  call void @test8(i64 -9223372036854775808, i32 1)
  call void @test8(i64 -1, i32 1)
  ret i32 0
}
