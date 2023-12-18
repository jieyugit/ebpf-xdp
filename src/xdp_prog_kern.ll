; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.9 = type { [2 x i32]*, [80 x i32]*, i32*, %struct.filter* }
%struct.filter = type { i32, i8, i8, i8, i32, i32, [4 x i32], [4 x i32], i8, i8, i8, i8, i8, i16, i8, i16, i8, i8, [2 x i8], %struct.tcpopts, %struct.udpopts, %struct.icmpopts }
%struct.tcpopts = type { i8, i16, i8, i16, i16, [2 x i8] }
%struct.udpopts = type { i8, i16, i8, i16 }
%struct.icmpopts = type { i8, i8, i8, i8 }
%struct.anon.10 = type { [6 x i32]*, i32*, %struct.datarec*, [5 x i32]* }
%struct.datarec = type { i64, i64 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.0 }
%union.anon.0 = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.2 }
%union.anon.2 = type { %struct.anon.3 }
%struct.anon.3 = type { i32, i32 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.5 }
%union.anon.5 = type { [1 x i32] }
%struct.icmphdr = type { i8, i8, i16, %union.anon.6 }
%union.anon.6 = type { i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }

@filters_map = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_prog_main.____fmt = internal constant [16 x i8] c"2filter->srcip\0A\00", align 1, !dbg !54
@xdp_prog_main.____fmt.1 = internal constant [7 x i8] c"hello\0A\00", align 1, !dbg !343
@xdp_prog_main.____fmt.2 = internal constant [34 x i8] c"Matched rule ID #%d. action = %d\0A\00", align 1, !dbg !348
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !353
@xdp_stats_map = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !356
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.9* @filters_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_prog_main to i8*), i8* bitcast (%struct.anon.10* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !56 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !71, metadata !DIExpression()), !dbg !409
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !410
  %6 = load i32, i32* %5, align 4, !dbg !410, !tbaa !411
  %7 = zext i32 %6 to i64, !dbg !416
  %8 = inttoptr i64 %7 to i8*, !dbg !417
  call void @llvm.dbg.value(metadata i8* %8, metadata !72, metadata !DIExpression()), !dbg !409
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !418
  %10 = load i32, i32* %9, align 4, !dbg !418, !tbaa !419
  %11 = zext i32 %10 to i64, !dbg !420
  %12 = inttoptr i64 %11 to i8*, !dbg !421
  call void @llvm.dbg.value(metadata i8* %12, metadata !73, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 2, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i8* %12, metadata !75, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* null, metadata !92, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.iphdr* null, metadata !139, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* null, metadata !167, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.icmphdr* null, metadata !211, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.tcphdr* null, metadata !234, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.udphdr* null, metadata !256, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 0, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !80, metadata !DIExpression(DW_OP_deref)), !dbg !409
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !422, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.value(metadata i8* %8, metadata !429, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !430, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.value(metadata i8* %12, metadata !431, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.value(metadata i32 14, metadata !432, metadata !DIExpression()), !dbg !433
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !435
  %14 = icmp ugt i8* %13, %8, !dbg !437
  br i1 %14, label %130, label %15, !dbg !438

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !431, metadata !DIExpression()), !dbg !433
  call void @llvm.dbg.value(metadata i8* %13, metadata !75, metadata !DIExpression()), !dbg !409
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !439
  %17 = bitcast i8* %16 to i16*, !dbg !439
  %18 = load i16, i16* %17, align 1, !dbg !439, !tbaa !440
  call void @llvm.dbg.value(metadata i16 %18, metadata !79, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !409
  switch i16 %18, label %130 [
    i16 -8826, label %19
    i16 8, label %71
  ], !dbg !443

19:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !444, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.value(metadata i8* %8, metadata !450, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !451, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.value(metadata i8* %13, metadata !452, metadata !DIExpression()), !dbg !453
  %20 = getelementptr i8, i8* %12, i64 54, !dbg !457
  %21 = bitcast i8* %20 to %struct.ipv6hdr*, !dbg !457
  %22 = inttoptr i64 %7 to %struct.ipv6hdr*, !dbg !459
  %23 = icmp ugt %struct.ipv6hdr* %21, %22, !dbg !460
  br i1 %23, label %29, label %24, !dbg !461

24:                                               ; preds = %19
  %25 = bitcast i8* %13 to %struct.ipv6hdr*, !dbg !462
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %25, metadata !452, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.value(metadata i8* %20, metadata !75, metadata !DIExpression()), !dbg !409
  %26 = getelementptr i8, i8* %12, i64 20, !dbg !463
  %27 = load i8, i8* %26, align 2, !dbg !463, !tbaa !464
  %28 = zext i8 %27 to i32, !dbg !466
  br label %29, !dbg !467

29:                                               ; preds = %19, %24
  %30 = phi i8* [ %13, %19 ], [ %20, %24 ], !dbg !409
  %31 = phi %struct.ipv6hdr* [ null, %19 ], [ %25, %24 ], !dbg !409
  %32 = phi i32 [ -1, %19 ], [ %28, %24 ], !dbg !453
  call void @llvm.dbg.value(metadata i8* %30, metadata !75, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %32, metadata !79, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %31, metadata !92, metadata !DIExpression()), !dbg !409
  %33 = icmp ne %struct.ipv6hdr* %31, null, !dbg !468
  %34 = icmp ne i32 %32, 17
  %35 = select i1 %33, i1 %34, i1 false, !dbg !470
  %36 = icmp ne i32 %32, 6
  %37 = select i1 %35, i1 %36, i1 false, !dbg !470
  %38 = icmp ne i32 %32, 58
  %39 = select i1 %37, i1 %38, i1 false, !dbg !470
  br i1 %39, label %653, label %40, !dbg !470

40:                                               ; preds = %29
  switch i32 %32, label %130 [
    i32 6, label %41
    i32 17, label %57
    i32 58, label %64
  ], !dbg !471

41:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !472, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata i8* %8, metadata !478, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !479, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata i8* %30, metadata !481, metadata !DIExpression()), !dbg !482
  %42 = getelementptr inbounds i8, i8* %30, i64 20, !dbg !485
  %43 = icmp ugt i8* %42, %8, !dbg !487
  br i1 %43, label %130, label %44, !dbg !488

44:                                               ; preds = %41
  %45 = getelementptr inbounds i8, i8* %30, i64 12, !dbg !489
  %46 = bitcast i8* %45 to i16*, !dbg !489
  %47 = load i16, i16* %46, align 4, !dbg !489
  %48 = lshr i16 %47, 2, !dbg !490
  %49 = and i16 %48, 60, !dbg !490
  call void @llvm.dbg.value(metadata i16 %49, metadata !480, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !482
  %50 = icmp ult i16 %49, 20, !dbg !491
  br i1 %50, label %130, label %51, !dbg !493

51:                                               ; preds = %44
  %52 = zext i16 %49 to i64
  call void @llvm.dbg.value(metadata i64 %52, metadata !480, metadata !DIExpression()), !dbg !482
  %53 = getelementptr i8, i8* %30, i64 %52, !dbg !494
  %54 = icmp ugt i8* %53, %8, !dbg !496
  br i1 %54, label %130, label %55, !dbg !497

55:                                               ; preds = %51
  call void @llvm.dbg.value(metadata i8* %53, metadata !75, metadata !DIExpression()), !dbg !409
  %56 = bitcast i8* %30 to %struct.tcphdr*, !dbg !498
  br label %130, !dbg !499

57:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !500, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i8* %8, metadata !506, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !507, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i8* %30, metadata !509, metadata !DIExpression()), !dbg !510
  %58 = getelementptr inbounds i8, i8* %30, i64 8, !dbg !512
  %59 = bitcast i8* %58 to %struct.udphdr*, !dbg !512
  %60 = inttoptr i64 %7 to %struct.udphdr*, !dbg !514
  %61 = icmp ugt %struct.udphdr* %59, %60, !dbg !515
  br i1 %61, label %130, label %62, !dbg !516

62:                                               ; preds = %57
  %63 = bitcast i8* %30 to %struct.udphdr*, !dbg !517
  call void @llvm.dbg.value(metadata %struct.udphdr* %63, metadata !509, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata %struct.udphdr* %59, metadata !75, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i16 undef, metadata !508, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !510
  br label %130, !dbg !518

64:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !519, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.value(metadata i8* %8, metadata !525, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !526, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.value(metadata i8* %30, metadata !527, metadata !DIExpression()), !dbg !528
  %65 = getelementptr inbounds i8, i8* %30, i64 8, !dbg !530
  %66 = bitcast i8* %65 to %struct.icmp6hdr*, !dbg !530
  %67 = inttoptr i64 %7 to %struct.icmp6hdr*, !dbg !532
  %68 = icmp ugt %struct.icmp6hdr* %66, %67, !dbg !533
  br i1 %68, label %130, label %69, !dbg !534

69:                                               ; preds = %64
  %70 = bitcast i8* %30 to %struct.icmp6hdr*, !dbg !535
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %70, metadata !527, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %66, metadata !75, metadata !DIExpression()), !dbg !409
  br label %130, !dbg !536

71:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !537, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i8* %8, metadata !543, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !544, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i8* %13, metadata !545, metadata !DIExpression()), !dbg !547
  %72 = getelementptr i8, i8* %12, i64 34, !dbg !551
  %73 = icmp ugt i8* %72, %8, !dbg !553
  br i1 %73, label %88, label %74, !dbg !554

74:                                               ; preds = %71
  %75 = load i8, i8* %13, align 4, !dbg !555
  %76 = shl i8 %75, 2, !dbg !556
  %77 = and i8 %76, 60, !dbg !556
  call void @llvm.dbg.value(metadata i8 %77, metadata !546, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !547
  %78 = icmp ult i8 %77, 20, !dbg !557
  br i1 %78, label %88, label %79, !dbg !559

79:                                               ; preds = %74
  %80 = zext i8 %77 to i64
  call void @llvm.dbg.value(metadata i64 %80, metadata !546, metadata !DIExpression()), !dbg !547
  %81 = getelementptr i8, i8* %13, i64 %80, !dbg !560
  %82 = icmp ugt i8* %81, %8, !dbg !562
  br i1 %82, label %88, label %83, !dbg !563

83:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8* %81, metadata !75, metadata !DIExpression()), !dbg !409
  %84 = bitcast i8* %13 to %struct.iphdr*, !dbg !564
  %85 = getelementptr i8, i8* %12, i64 23, !dbg !565
  %86 = load i8, i8* %85, align 1, !dbg !565, !tbaa !566
  %87 = zext i8 %86 to i32, !dbg !568
  br label %88, !dbg !569

88:                                               ; preds = %71, %74, %79, %83
  %89 = phi i8* [ %13, %71 ], [ %13, %74 ], [ %13, %79 ], [ %81, %83 ], !dbg !409
  %90 = phi %struct.iphdr* [ null, %71 ], [ null, %74 ], [ null, %79 ], [ %84, %83 ], !dbg !409
  %91 = phi i32 [ -1, %71 ], [ -1, %74 ], [ -1, %79 ], [ %87, %83 ], !dbg !547
  call void @llvm.dbg.value(metadata i8* %89, metadata !75, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %91, metadata !79, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata %struct.iphdr* %90, metadata !139, metadata !DIExpression()), !dbg !409
  %92 = icmp ne %struct.iphdr* %90, null, !dbg !570
  %93 = icmp ne i32 %91, 17
  %94 = select i1 %92, i1 %93, i1 false, !dbg !572
  %95 = icmp ne i32 %91, 6
  %96 = select i1 %94, i1 %95, i1 false, !dbg !572
  %97 = icmp ne i32 %91, 1
  %98 = select i1 %96, i1 %97, i1 false, !dbg !572
  br i1 %98, label %653, label %99, !dbg !572

99:                                               ; preds = %88
  switch i32 %91, label %130 [
    i32 6, label %100
    i32 17, label %116
    i32 1, label %123
  ], !dbg !573

100:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !472, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i8* %8, metadata !478, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !479, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i8* %89, metadata !481, metadata !DIExpression()), !dbg !574
  %101 = getelementptr inbounds i8, i8* %89, i64 20, !dbg !577
  %102 = icmp ugt i8* %101, %8, !dbg !578
  br i1 %102, label %130, label %103, !dbg !579

103:                                              ; preds = %100
  %104 = getelementptr inbounds i8, i8* %89, i64 12, !dbg !580
  %105 = bitcast i8* %104 to i16*, !dbg !580
  %106 = load i16, i16* %105, align 4, !dbg !580
  %107 = lshr i16 %106, 2, !dbg !581
  %108 = and i16 %107, 60, !dbg !581
  call void @llvm.dbg.value(metadata i16 %108, metadata !480, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !574
  %109 = icmp ult i16 %108, 20, !dbg !582
  br i1 %109, label %130, label %110, !dbg !583

110:                                              ; preds = %103
  %111 = zext i16 %108 to i64
  call void @llvm.dbg.value(metadata i64 %111, metadata !480, metadata !DIExpression()), !dbg !574
  %112 = getelementptr i8, i8* %89, i64 %111, !dbg !584
  %113 = icmp ugt i8* %112, %8, !dbg !585
  br i1 %113, label %130, label %114, !dbg !586

114:                                              ; preds = %110
  call void @llvm.dbg.value(metadata i8* %112, metadata !75, metadata !DIExpression()), !dbg !409
  %115 = bitcast i8* %89 to %struct.tcphdr*, !dbg !587
  br label %130, !dbg !588

116:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !500, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.value(metadata i8* %8, metadata !506, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !507, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.value(metadata i8* %89, metadata !509, metadata !DIExpression()), !dbg !589
  %117 = getelementptr inbounds i8, i8* %89, i64 8, !dbg !591
  %118 = bitcast i8* %117 to %struct.udphdr*, !dbg !591
  %119 = inttoptr i64 %7 to %struct.udphdr*, !dbg !592
  %120 = icmp ugt %struct.udphdr* %118, %119, !dbg !593
  br i1 %120, label %130, label %121, !dbg !594

121:                                              ; preds = %116
  %122 = bitcast i8* %89 to %struct.udphdr*, !dbg !595
  call void @llvm.dbg.value(metadata %struct.udphdr* %122, metadata !509, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.value(metadata %struct.udphdr* %118, metadata !75, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i16 undef, metadata !508, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !589
  br label %130, !dbg !596

123:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !597, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.value(metadata i8* %8, metadata !603, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !604, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.value(metadata i8* %89, metadata !605, metadata !DIExpression()), !dbg !606
  %124 = getelementptr inbounds i8, i8* %89, i64 8, !dbg !608
  %125 = bitcast i8* %124 to %struct.icmphdr*, !dbg !608
  %126 = inttoptr i64 %7 to %struct.icmphdr*, !dbg !610
  %127 = icmp ugt %struct.icmphdr* %125, %126, !dbg !611
  br i1 %127, label %130, label %128, !dbg !612

128:                                              ; preds = %123
  %129 = bitcast i8* %89 to %struct.icmphdr*, !dbg !613
  call void @llvm.dbg.value(metadata %struct.icmphdr* %129, metadata !605, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.value(metadata %struct.icmphdr* %125, metadata !75, metadata !DIExpression()), !dbg !409
  br label %130, !dbg !614

130:                                              ; preds = %1, %128, %123, %121, %116, %114, %110, %103, %100, %69, %64, %62, %57, %55, %51, %44, %41, %15, %99, %40
  %131 = phi %struct.ipv6hdr* [ null, %15 ], [ null, %99 ], [ %31, %40 ], [ %31, %41 ], [ %31, %44 ], [ %31, %51 ], [ %31, %55 ], [ %31, %57 ], [ %31, %62 ], [ %31, %64 ], [ %31, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !615
  %132 = phi %struct.iphdr* [ null, %15 ], [ %90, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ %90, %100 ], [ %90, %103 ], [ %90, %110 ], [ %90, %114 ], [ %90, %116 ], [ %90, %121 ], [ %90, %123 ], [ %90, %128 ], [ null, %1 ], !dbg !616
  %133 = phi %struct.icmp6hdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ %70, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !617
  %134 = phi %struct.icmphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ %129, %128 ], [ null, %1 ], !dbg !618
  %135 = phi %struct.tcphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ %56, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ %115, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !619
  %136 = phi %struct.udphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ %63, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ %122, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !620
  call void @llvm.dbg.value(metadata i8 0, metadata !266, metadata !DIExpression()), !dbg !621
  %137 = bitcast i32* %4 to i8*
  call void @llvm.dbg.value(metadata i32 2, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 0, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i8 0, metadata !266, metadata !DIExpression()), !dbg !621
  %138 = icmp eq %struct.ipv6hdr* %131, null
  %139 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 0
  %140 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 1
  %141 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 2
  %142 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 3
  %143 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 0
  %144 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 1
  %145 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 2
  %146 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 3
  %147 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 4
  %148 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 2
  %149 = icmp eq %struct.iphdr* %132, null
  %150 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 8, i32 0, i32 0
  %151 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 8, i32 0, i32 1
  %152 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 1
  %153 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 5
  %154 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 2
  %155 = icmp eq %struct.tcphdr* %135, null
  %156 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 0
  %157 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 1
  %158 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 4
  %159 = icmp eq %struct.udphdr* %136, null
  %160 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %136, i64 0, i32 0
  %161 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %136, i64 0, i32 1
  %162 = icmp eq %struct.icmphdr* %134, null
  %163 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %134, i64 0, i32 1
  %164 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %134, i64 0, i32 0
  %165 = icmp eq %struct.icmp6hdr* %133, null
  %166 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %133, i64 0, i32 1
  %167 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %133, i64 0, i32 0
  br label %168, !dbg !622

168:                                              ; preds = %130, %602
  %169 = phi i32 [ 0, %130 ], [ %605, %602 ]
  %170 = phi i32 [ 2, %130 ], [ %604, %602 ]
  %171 = phi i32 [ 0, %130 ], [ %603, %602 ]
  call void @llvm.dbg.value(metadata i32 %170, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %171, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %169, metadata !266, metadata !DIExpression()), !dbg !621
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %137) #4, !dbg !623
  call void @llvm.dbg.value(metadata i32 %169, metadata !268, metadata !DIExpression()), !dbg !624
  store i32 %169, i32* %4, align 4, !dbg !625, !tbaa !626
  call void @llvm.dbg.value(metadata i32* %4, metadata !268, metadata !DIExpression(DW_OP_deref)), !dbg !624
  %172 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.9* @filters_map to i8*), i8* noundef nonnull %137) #4, !dbg !627
  call void @llvm.dbg.value(metadata i8* %172, metadata !271, metadata !DIExpression()), !dbg !624
  %173 = icmp eq i8* %172, null, !dbg !628
  br i1 %173, label %601, label %174, !dbg !630

174:                                              ; preds = %168
  %175 = bitcast i8* %172 to i32*, !dbg !631
  %176 = getelementptr inbounds i8, i8* %172, i64 4, !dbg !632
  %177 = load i8, i8* %176, align 4, !dbg !632
  %178 = and i8 %177, 1, !dbg !632
  %179 = icmp eq i8 %178, 0, !dbg !634
  br i1 %179, label %602, label %180, !dbg !635

180:                                              ; preds = %174
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  br i1 %138, label %293, label %181, !dbg !636

181:                                              ; preds = %180
  %182 = getelementptr inbounds i8, i8* %172, i64 16, !dbg !637
  %183 = bitcast i8* %182 to i32*, !dbg !641
  %184 = load i32, i32* %183, align 4, !dbg !641, !tbaa !626
  %185 = icmp eq i32 %184, 0, !dbg !642
  br i1 %185, label %207, label %186, !dbg !643

186:                                              ; preds = %181
  %187 = load i32, i32* %139, align 4, !dbg !644, !tbaa !645
  %188 = icmp eq i32 %187, %184, !dbg !646
  br i1 %188, label %189, label %602, !dbg !647

189:                                              ; preds = %186
  %190 = load i32, i32* %140, align 4, !dbg !648, !tbaa !645
  %191 = getelementptr inbounds i8, i8* %172, i64 20, !dbg !649
  %192 = bitcast i8* %191 to i32*, !dbg !649
  %193 = load i32, i32* %192, align 4, !dbg !649, !tbaa !626
  %194 = icmp eq i32 %190, %193, !dbg !650
  br i1 %194, label %195, label %602, !dbg !651

195:                                              ; preds = %189
  %196 = load i32, i32* %141, align 4, !dbg !652, !tbaa !645
  %197 = getelementptr inbounds i8, i8* %172, i64 24, !dbg !653
  %198 = bitcast i8* %197 to i32*, !dbg !653
  %199 = load i32, i32* %198, align 4, !dbg !653, !tbaa !626
  %200 = icmp eq i32 %196, %199, !dbg !654
  br i1 %200, label %201, label %602, !dbg !655

201:                                              ; preds = %195
  %202 = load i32, i32* %142, align 4, !dbg !656, !tbaa !645
  %203 = getelementptr inbounds i8, i8* %172, i64 28, !dbg !657
  %204 = bitcast i8* %203 to i32*, !dbg !657
  %205 = load i32, i32* %204, align 4, !dbg !657, !tbaa !626
  %206 = icmp eq i32 %202, %205, !dbg !658
  br i1 %206, label %207, label %602, !dbg !659

207:                                              ; preds = %201, %181
  %208 = getelementptr inbounds i8, i8* %172, i64 32, !dbg !660
  %209 = bitcast i8* %208 to i32*, !dbg !662
  %210 = load i32, i32* %209, align 4, !dbg !662, !tbaa !626
  %211 = icmp eq i32 %210, 0, !dbg !663
  br i1 %211, label %233, label %212, !dbg !664

212:                                              ; preds = %207
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  %213 = load i32, i32* %143, align 4, !dbg !665, !tbaa !645
  %214 = icmp eq i32 %213, %210, !dbg !666
  br i1 %214, label %215, label %602, !dbg !667

215:                                              ; preds = %212
  %216 = load i32, i32* %144, align 4, !dbg !668, !tbaa !645
  %217 = getelementptr inbounds i8, i8* %172, i64 36, !dbg !669
  %218 = bitcast i8* %217 to i32*, !dbg !669
  %219 = load i32, i32* %218, align 4, !dbg !669, !tbaa !626
  %220 = icmp eq i32 %216, %219, !dbg !670
  br i1 %220, label %221, label %602, !dbg !671

221:                                              ; preds = %215
  %222 = load i32, i32* %145, align 4, !dbg !672, !tbaa !645
  %223 = getelementptr inbounds i8, i8* %172, i64 40, !dbg !673
  %224 = bitcast i8* %223 to i32*, !dbg !673
  %225 = load i32, i32* %224, align 4, !dbg !673, !tbaa !626
  %226 = icmp eq i32 %222, %225, !dbg !674
  br i1 %226, label %227, label %602, !dbg !675

227:                                              ; preds = %221
  %228 = load i32, i32* %146, align 4, !dbg !676, !tbaa !645
  %229 = getelementptr inbounds i8, i8* %172, i64 44, !dbg !677
  %230 = bitcast i8* %229 to i32*, !dbg !677
  %231 = load i32, i32* %230, align 4, !dbg !677, !tbaa !626
  %232 = icmp eq i32 %228, %231, !dbg !678
  br i1 %232, label %233, label %602, !dbg !679

233:                                              ; preds = %227, %207
  %234 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !680
  %235 = bitcast i8* %234 to i32*, !dbg !680
  %236 = load i32, i32* %235, align 4, !dbg !680, !tbaa !682
  %237 = icmp eq i32 %236, 0, !dbg !687
  br i1 %237, label %238, label %602, !dbg !688

238:                                              ; preds = %233
  %239 = getelementptr inbounds i8, i8* %172, i64 12, !dbg !689
  %240 = bitcast i8* %239 to i32*, !dbg !689
  %241 = load i32, i32* %240, align 4, !dbg !689, !tbaa !690
  %242 = icmp eq i32 %241, 0, !dbg !691
  br i1 %242, label %243, label %602, !dbg !692

243:                                              ; preds = %238
  %244 = getelementptr inbounds i8, i8* %172, i64 50, !dbg !693
  %245 = load i8, i8* %244, align 2, !dbg !693
  %246 = and i8 %245, 1, !dbg !693
  %247 = icmp eq i8 %246, 0, !dbg !695
  br i1 %247, label %253, label %248, !dbg !696

248:                                              ; preds = %243
  %249 = getelementptr inbounds i8, i8* %172, i64 51, !dbg !697
  %250 = load i8, i8* %249, align 1, !dbg !697, !tbaa !698
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  %251 = load i8, i8* %147, align 1, !dbg !699, !tbaa !700
  %252 = icmp ugt i8 %250, %251, !dbg !701
  br i1 %252, label %602, label %253, !dbg !702

253:                                              ; preds = %248, %243
  %254 = getelementptr inbounds i8, i8* %172, i64 48, !dbg !703
  %255 = load i8, i8* %254, align 4, !dbg !703
  %256 = and i8 %255, 1, !dbg !703
  %257 = icmp eq i8 %256, 0, !dbg !705
  br i1 %257, label %263, label %258, !dbg !706

258:                                              ; preds = %253
  %259 = getelementptr inbounds i8, i8* %172, i64 49, !dbg !707
  %260 = load i8, i8* %259, align 1, !dbg !707, !tbaa !708
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  %261 = load i8, i8* %147, align 1, !dbg !709, !tbaa !700
  %262 = icmp ult i8 %260, %261, !dbg !710
  br i1 %262, label %602, label %263, !dbg !711

263:                                              ; preds = %258, %253
  %264 = getelementptr inbounds i8, i8* %172, i64 56, !dbg !712
  %265 = load i8, i8* %264, align 4, !dbg !712
  %266 = and i8 %265, 1, !dbg !712
  %267 = icmp eq i8 %266, 0, !dbg !714
  br i1 %267, label %278, label %268, !dbg !715

268:                                              ; preds = %263
  %269 = getelementptr inbounds i8, i8* %172, i64 58, !dbg !716
  %270 = bitcast i8* %269 to i16*, !dbg !716
  %271 = load i16, i16* %270, align 2, !dbg !716, !tbaa !717
  %272 = zext i16 %271 to i64, !dbg !718
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  %273 = load i16, i16* %148, align 4, !dbg !719, !tbaa !720
  %274 = call i16 @llvm.bswap.i16(i16 %273)
  %275 = zext i16 %274 to i64, !dbg !719
  %276 = add nuw nsw i64 %275, 14, !dbg !721
  %277 = icmp ult i64 %276, %272, !dbg !722
  br i1 %277, label %602, label %278, !dbg !723

278:                                              ; preds = %268, %263
  %279 = getelementptr inbounds i8, i8* %172, i64 52, !dbg !724
  %280 = load i8, i8* %279, align 4, !dbg !724
  %281 = and i8 %280, 1, !dbg !724
  %282 = icmp eq i8 %281, 0, !dbg !726
  br i1 %282, label %414, label %283, !dbg !727

283:                                              ; preds = %278
  %284 = getelementptr inbounds i8, i8* %172, i64 54, !dbg !728
  %285 = bitcast i8* %284 to i16*, !dbg !728
  %286 = load i16, i16* %285, align 2, !dbg !728, !tbaa !729
  %287 = zext i16 %286 to i64, !dbg !730
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !409
  %288 = load i16, i16* %148, align 4, !dbg !731, !tbaa !720
  %289 = call i16 @llvm.bswap.i16(i16 %288)
  %290 = zext i16 %289 to i64, !dbg !731
  %291 = add nuw nsw i64 %290, 14, !dbg !732
  %292 = icmp ugt i64 %291, %287, !dbg !733
  br i1 %292, label %602, label %414, !dbg !734

293:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  br i1 %149, label %414, label %294, !dbg !735

294:                                              ; preds = %293
  %295 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !736
  %296 = bitcast i8* %295 to i32*, !dbg !736
  %297 = load i32, i32* %296, align 4, !dbg !736, !tbaa !682
  %298 = icmp eq i32 %297, 0, !dbg !740
  br i1 %298, label %302, label %299, !dbg !741

299:                                              ; preds = %294
  %300 = load i32, i32* %150, align 4, !dbg !742, !tbaa !645
  %301 = icmp eq i32 %300, %297, !dbg !743
  br i1 %301, label %302, label %602, !dbg !744

302:                                              ; preds = %299, %294
  %303 = getelementptr inbounds i8, i8* %172, i64 12, !dbg !745
  %304 = bitcast i8* %303 to i32*, !dbg !745
  %305 = load i32, i32* %304, align 4, !dbg !745, !tbaa !690
  %306 = icmp eq i32 %305, 0, !dbg !747
  br i1 %306, label %312, label %307, !dbg !748

307:                                              ; preds = %302
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %308 = load i32, i32* %151, align 4, !dbg !749, !tbaa !645
  %309 = icmp eq i32 %308, %305, !dbg !750
  br i1 %309, label %312, label %310, !dbg !751

310:                                              ; preds = %307
  %311 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @xdp_prog_main.____fmt, i64 0, i64 0), i32 noundef 16) #4, !dbg !752
  br label %602, !dbg !755

312:                                              ; preds = %307, %302
  %313 = getelementptr inbounds i8, i8* %172, i64 16, !dbg !756
  %314 = bitcast i8* %313 to i32*, !dbg !758
  %315 = load i32, i32* %314, align 4, !dbg !758, !tbaa !626
  %316 = icmp eq i32 %315, 0, !dbg !759
  br i1 %316, label %317, label %602, !dbg !760

317:                                              ; preds = %312
  %318 = getelementptr inbounds i8, i8* %172, i64 20, !dbg !761
  %319 = bitcast i8* %318 to i32*, !dbg !761
  %320 = load i32, i32* %319, align 4, !dbg !761, !tbaa !626
  %321 = icmp eq i32 %320, 0, !dbg !762
  br i1 %321, label %322, label %602, !dbg !763

322:                                              ; preds = %317
  %323 = getelementptr inbounds i8, i8* %172, i64 24, !dbg !764
  %324 = bitcast i8* %323 to i32*, !dbg !764
  %325 = load i32, i32* %324, align 4, !dbg !764, !tbaa !626
  %326 = icmp eq i32 %325, 0, !dbg !765
  br i1 %326, label %327, label %602, !dbg !766

327:                                              ; preds = %322
  %328 = getelementptr inbounds i8, i8* %172, i64 28, !dbg !767
  %329 = bitcast i8* %328 to i32*, !dbg !767
  %330 = load i32, i32* %329, align 4, !dbg !767, !tbaa !626
  %331 = icmp eq i32 %330, 0, !dbg !768
  br i1 %331, label %332, label %602, !dbg !769

332:                                              ; preds = %327
  %333 = getelementptr inbounds i8, i8* %172, i64 32, !dbg !770
  %334 = bitcast i8* %333 to i32*, !dbg !771
  %335 = load i32, i32* %334, align 4, !dbg !771, !tbaa !626
  %336 = icmp eq i32 %335, 0, !dbg !772
  br i1 %336, label %337, label %602, !dbg !773

337:                                              ; preds = %332
  %338 = getelementptr inbounds i8, i8* %172, i64 36, !dbg !774
  %339 = bitcast i8* %338 to i32*, !dbg !774
  %340 = load i32, i32* %339, align 4, !dbg !774, !tbaa !626
  %341 = icmp eq i32 %340, 0, !dbg !775
  br i1 %341, label %342, label %602, !dbg !776

342:                                              ; preds = %337
  %343 = getelementptr inbounds i8, i8* %172, i64 40, !dbg !777
  %344 = bitcast i8* %343 to i32*, !dbg !777
  %345 = load i32, i32* %344, align 4, !dbg !777, !tbaa !626
  %346 = icmp eq i32 %345, 0, !dbg !778
  br i1 %346, label %347, label %602, !dbg !779

347:                                              ; preds = %342
  %348 = getelementptr inbounds i8, i8* %172, i64 44, !dbg !780
  %349 = bitcast i8* %348 to i32*, !dbg !780
  %350 = load i32, i32* %349, align 4, !dbg !780, !tbaa !626
  %351 = icmp eq i32 %350, 0, !dbg !781
  br i1 %351, label %352, label %602, !dbg !782

352:                                              ; preds = %347
  %353 = getelementptr inbounds i8, i8* %172, i64 60, !dbg !783
  %354 = load i8, i8* %353, align 4, !dbg !783
  %355 = and i8 %354, 1, !dbg !783
  %356 = icmp eq i8 %355, 0, !dbg !785
  br i1 %356, label %364, label %357, !dbg !786

357:                                              ; preds = %352
  %358 = getelementptr inbounds i8, i8* %172, i64 61, !dbg !787
  %359 = load i8, i8* %358, align 1, !dbg !787, !tbaa !788
  %360 = sext i8 %359 to i32, !dbg !789
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %361 = load i8, i8* %152, align 1, !dbg !790, !tbaa !791
  %362 = zext i8 %361 to i32, !dbg !792
  %363 = icmp eq i32 %360, %362, !dbg !793
  br i1 %363, label %364, label %602, !dbg !794

364:                                              ; preds = %357, %352
  %365 = getelementptr inbounds i8, i8* %172, i64 50, !dbg !795
  %366 = load i8, i8* %365, align 2, !dbg !795
  %367 = and i8 %366, 1, !dbg !795
  %368 = icmp eq i8 %367, 0, !dbg !797
  br i1 %368, label %374, label %369, !dbg !798

369:                                              ; preds = %364
  %370 = getelementptr inbounds i8, i8* %172, i64 51, !dbg !799
  %371 = load i8, i8* %370, align 1, !dbg !799, !tbaa !698
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %372 = load i8, i8* %153, align 4, !dbg !800, !tbaa !801
  %373 = icmp ult i8 %371, %372, !dbg !802
  br i1 %373, label %602, label %374, !dbg !803

374:                                              ; preds = %369, %364
  %375 = getelementptr inbounds i8, i8* %172, i64 48, !dbg !804
  %376 = load i8, i8* %375, align 4, !dbg !804
  %377 = and i8 %376, 1, !dbg !804
  %378 = icmp eq i8 %377, 0, !dbg !806
  br i1 %378, label %384, label %379, !dbg !807

379:                                              ; preds = %374
  %380 = getelementptr inbounds i8, i8* %172, i64 49, !dbg !808
  %381 = load i8, i8* %380, align 1, !dbg !808, !tbaa !708
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %382 = load i8, i8* %153, align 4, !dbg !809, !tbaa !801
  %383 = icmp ugt i8 %381, %382, !dbg !810
  br i1 %383, label %602, label %384, !dbg !811

384:                                              ; preds = %379, %374
  %385 = getelementptr inbounds i8, i8* %172, i64 56, !dbg !812
  %386 = load i8, i8* %385, align 4, !dbg !812
  %387 = and i8 %386, 1, !dbg !812
  %388 = icmp eq i8 %387, 0, !dbg !814
  br i1 %388, label %399, label %389, !dbg !815

389:                                              ; preds = %384
  %390 = getelementptr inbounds i8, i8* %172, i64 58, !dbg !816
  %391 = bitcast i8* %390 to i16*, !dbg !816
  %392 = load i16, i16* %391, align 2, !dbg !816, !tbaa !717
  %393 = zext i16 %392 to i64, !dbg !817
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %394 = load i16, i16* %154, align 2, !dbg !818, !tbaa !819
  %395 = call i16 @llvm.bswap.i16(i16 %394)
  %396 = zext i16 %395 to i64, !dbg !818
  %397 = add nuw nsw i64 %396, 14, !dbg !820
  %398 = icmp ugt i64 %397, %393, !dbg !821
  br i1 %398, label %602, label %399, !dbg !822

399:                                              ; preds = %389, %384
  %400 = getelementptr inbounds i8, i8* %172, i64 52, !dbg !823
  %401 = load i8, i8* %400, align 4, !dbg !823
  %402 = and i8 %401, 1, !dbg !823
  %403 = icmp eq i8 %402, 0, !dbg !825
  br i1 %403, label %414, label %404, !dbg !826

404:                                              ; preds = %399
  %405 = getelementptr inbounds i8, i8* %172, i64 54, !dbg !827
  %406 = bitcast i8* %405 to i16*, !dbg !827
  %407 = load i16, i16* %406, align 2, !dbg !827, !tbaa !729
  %408 = zext i16 %407 to i64, !dbg !828
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !409
  %409 = load i16, i16* %154, align 2, !dbg !829, !tbaa !819
  %410 = call i16 @llvm.bswap.i16(i16 %409)
  %411 = zext i16 %410 to i64, !dbg !829
  %412 = add nuw nsw i64 %411, 14, !dbg !830
  %413 = icmp ult i64 %412, %408, !dbg !831
  br i1 %413, label %602, label %414, !dbg !832

414:                                              ; preds = %293, %404, %399, %278, %283
  %415 = getelementptr inbounds i8, i8* %172, i64 64, !dbg !833
  %416 = load i8, i8* %415, align 4, !dbg !835
  %417 = and i8 %416, 1, !dbg !835
  %418 = icmp eq i8 %417, 0, !dbg !836
  br i1 %418, label %520, label %419, !dbg !837

419:                                              ; preds = %414
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  br i1 %155, label %602, label %420, !dbg !838

420:                                              ; preds = %419
  %421 = and i8 %416, 2, !dbg !840
  %422 = icmp eq i8 %421, 0, !dbg !840
  br i1 %422, label %430, label %423, !dbg !842

423:                                              ; preds = %420
  %424 = getelementptr inbounds i8, i8* %172, i64 66, !dbg !843
  %425 = bitcast i8* %424 to i16*, !dbg !843
  %426 = load i16, i16* %425, align 2, !dbg !843, !tbaa !844
  %427 = call i16 @llvm.bswap.i16(i16 %426)
  %428 = load i16, i16* %156, align 4, !dbg !845, !tbaa !846
  %429 = icmp eq i16 %427, %428, !dbg !848
  br i1 %429, label %430, label %602, !dbg !849

430:                                              ; preds = %423, %420
  %431 = getelementptr inbounds i8, i8* %172, i64 68, !dbg !850
  %432 = load i8, i8* %431, align 4, !dbg !850
  %433 = and i8 %432, 1, !dbg !850
  %434 = icmp eq i8 %433, 0, !dbg !852
  br i1 %434, label %442, label %435, !dbg !853

435:                                              ; preds = %430
  %436 = getelementptr inbounds i8, i8* %172, i64 70, !dbg !854
  %437 = bitcast i8* %436 to i16*, !dbg !854
  %438 = load i16, i16* %437, align 2, !dbg !854, !tbaa !855
  %439 = call i16 @llvm.bswap.i16(i16 %438)
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %440 = load i16, i16* %157, align 2, !dbg !856, !tbaa !857
  %441 = icmp eq i16 %439, %440, !dbg !858
  br i1 %441, label %442, label %602, !dbg !859

442:                                              ; preds = %435, %430
  %443 = getelementptr inbounds i8, i8* %172, i64 72, !dbg !860
  %444 = bitcast i8* %443 to i16*, !dbg !860
  %445 = load i16, i16* %444, align 4, !dbg !860
  %446 = and i16 %445, 1, !dbg !860
  %447 = icmp eq i16 %446, 0, !dbg !862
  br i1 %447, label %455, label %448, !dbg !863

448:                                              ; preds = %442
  %449 = lshr i16 %445, 1, !dbg !864
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %450 = load i16, i16* %158, align 4, !dbg !865
  %451 = lshr i16 %450, 13, !dbg !865
  %452 = xor i16 %451, %449, !dbg !866
  %453 = and i16 %452, 1, !dbg !866
  %454 = icmp eq i16 %453, 0, !dbg !866
  br i1 %454, label %455, label %602, !dbg !867

455:                                              ; preds = %448, %442
  %456 = and i16 %445, 4, !dbg !868
  %457 = icmp eq i16 %456, 0, !dbg !868
  br i1 %457, label %465, label %458, !dbg !870

458:                                              ; preds = %455
  %459 = lshr i16 %445, 3, !dbg !871
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %460 = load i16, i16* %158, align 4, !dbg !872
  %461 = lshr i16 %460, 12, !dbg !872
  %462 = xor i16 %461, %459, !dbg !873
  %463 = and i16 %462, 1, !dbg !873
  %464 = icmp eq i16 %463, 0, !dbg !873
  br i1 %464, label %465, label %602, !dbg !874

465:                                              ; preds = %458, %455
  %466 = and i16 %445, 16, !dbg !875
  %467 = icmp eq i16 %466, 0, !dbg !875
  br i1 %467, label %475, label %468, !dbg !877

468:                                              ; preds = %465
  %469 = lshr i16 %445, 5, !dbg !878
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %470 = load i16, i16* %158, align 4, !dbg !879
  %471 = lshr i16 %470, 10, !dbg !879
  %472 = xor i16 %471, %469, !dbg !880
  %473 = and i16 %472, 1, !dbg !880
  %474 = icmp eq i16 %473, 0, !dbg !880
  br i1 %474, label %475, label %602, !dbg !881

475:                                              ; preds = %468, %465
  %476 = and i16 %445, 64, !dbg !882
  %477 = icmp eq i16 %476, 0, !dbg !882
  br i1 %477, label %485, label %478, !dbg !884

478:                                              ; preds = %475
  %479 = lshr i16 %445, 7, !dbg !885
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %480 = load i16, i16* %158, align 4, !dbg !886
  %481 = lshr i16 %480, 11, !dbg !886
  %482 = xor i16 %481, %479, !dbg !887
  %483 = and i16 %482, 1, !dbg !887
  %484 = icmp eq i16 %483, 0, !dbg !887
  br i1 %484, label %485, label %602, !dbg !888

485:                                              ; preds = %478, %475
  %486 = and i16 %445, 256, !dbg !889
  %487 = icmp eq i16 %486, 0, !dbg !889
  br i1 %487, label %493, label %488, !dbg !891

488:                                              ; preds = %485
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %489 = load i16, i16* %158, align 4, !dbg !892
  %490 = xor i16 %489, %445, !dbg !893
  %491 = and i16 %490, 512, !dbg !893
  %492 = icmp eq i16 %491, 0, !dbg !893
  br i1 %492, label %493, label %602, !dbg !894

493:                                              ; preds = %488, %485
  %494 = and i16 %445, 1024, !dbg !895
  %495 = icmp eq i16 %494, 0, !dbg !895
  br i1 %495, label %503, label %496, !dbg !897

496:                                              ; preds = %493
  %497 = lshr i16 %445, 11, !dbg !898
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %498 = load i16, i16* %158, align 4, !dbg !899
  %499 = lshr i16 %498, 8, !dbg !899
  %500 = xor i16 %499, %497, !dbg !900
  %501 = and i16 %500, 1, !dbg !900
  %502 = icmp eq i16 %501, 0, !dbg !900
  br i1 %502, label %503, label %602, !dbg !901

503:                                              ; preds = %496, %493
  %504 = and i16 %445, 4096, !dbg !902
  %505 = icmp eq i16 %504, 0, !dbg !902
  br i1 %505, label %513, label %506, !dbg !904

506:                                              ; preds = %503
  %507 = lshr i16 %445, 13, !dbg !905
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %508 = load i16, i16* %158, align 4, !dbg !906
  %509 = lshr i16 %508, 14, !dbg !906
  %510 = xor i16 %509, %507, !dbg !907
  %511 = and i16 %510, 1, !dbg !907
  %512 = icmp eq i16 %511, 0, !dbg !907
  br i1 %512, label %513, label %602, !dbg !908

513:                                              ; preds = %506, %503
  %514 = and i16 %445, 16384, !dbg !909
  %515 = icmp eq i16 %514, 0, !dbg !909
  br i1 %515, label %593, label %516, !dbg !911

516:                                              ; preds = %513
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !409
  %517 = load i16, i16* %158, align 4, !dbg !912
  %518 = xor i16 %517, %445, !dbg !913
  %519 = icmp sgt i16 %518, -1, !dbg !913
  br i1 %519, label %593, label %602, !dbg !914

520:                                              ; preds = %414
  %521 = getelementptr inbounds i8, i8* %172, i64 76, !dbg !915
  %522 = load i8, i8* %521, align 4, !dbg !917
  %523 = and i8 %522, 1, !dbg !917
  %524 = icmp eq i8 %523, 0, !dbg !918
  br i1 %524, label %548, label %525, !dbg !919

525:                                              ; preds = %520
  call void @llvm.dbg.value(metadata %struct.udphdr* %136, metadata !256, metadata !DIExpression()), !dbg !409
  br i1 %159, label %602, label %526, !dbg !920

526:                                              ; preds = %525
  %527 = and i8 %522, 2, !dbg !922
  %528 = icmp eq i8 %527, 0, !dbg !922
  br i1 %528, label %536, label %529, !dbg !924

529:                                              ; preds = %526
  %530 = getelementptr inbounds i8, i8* %172, i64 78, !dbg !925
  %531 = bitcast i8* %530 to i16*, !dbg !925
  %532 = load i16, i16* %531, align 2, !dbg !925, !tbaa !926
  %533 = call i16 @llvm.bswap.i16(i16 %532)
  %534 = load i16, i16* %160, align 2, !dbg !927, !tbaa !928
  %535 = icmp eq i16 %533, %534, !dbg !930
  br i1 %535, label %536, label %602, !dbg !931

536:                                              ; preds = %529, %526
  %537 = getelementptr inbounds i8, i8* %172, i64 80, !dbg !932
  %538 = load i8, i8* %537, align 4, !dbg !932
  %539 = and i8 %538, 1, !dbg !932
  %540 = icmp eq i8 %539, 0, !dbg !934
  br i1 %540, label %593, label %541, !dbg !935

541:                                              ; preds = %536
  %542 = getelementptr inbounds i8, i8* %172, i64 82, !dbg !936
  %543 = bitcast i8* %542 to i16*, !dbg !936
  %544 = load i16, i16* %543, align 2, !dbg !936, !tbaa !937
  %545 = call i16 @llvm.bswap.i16(i16 %544)
  call void @llvm.dbg.value(metadata %struct.udphdr* %136, metadata !256, metadata !DIExpression()), !dbg !409
  %546 = load i16, i16* %161, align 2, !dbg !938, !tbaa !939
  %547 = icmp eq i16 %545, %546, !dbg !940
  br i1 %547, label %593, label %602, !dbg !941

548:                                              ; preds = %520
  %549 = getelementptr inbounds i8, i8* %172, i64 84, !dbg !942
  %550 = load i8, i8* %549, align 4, !dbg !944
  %551 = and i8 %550, 1, !dbg !944
  %552 = icmp eq i8 %551, 0, !dbg !945
  br i1 %552, label %593, label %553, !dbg !946

553:                                              ; preds = %548
  call void @llvm.dbg.value(metadata %struct.icmphdr* %134, metadata !211, metadata !DIExpression()), !dbg !409
  br i1 %162, label %574, label %554, !dbg !947

554:                                              ; preds = %553
  %555 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @xdp_prog_main.____fmt.1, i64 0, i64 0), i32 noundef 7) #4, !dbg !949
  %556 = load i8, i8* %549, align 4, !dbg !953
  %557 = and i8 %556, 2, !dbg !955
  %558 = icmp eq i8 %557, 0, !dbg !955
  br i1 %558, label %564, label %559, !dbg !956

559:                                              ; preds = %554
  %560 = getelementptr inbounds i8, i8* %172, i64 85, !dbg !957
  %561 = load i8, i8* %560, align 1, !dbg !957, !tbaa !958
  call void @llvm.dbg.value(metadata %struct.icmphdr* %134, metadata !211, metadata !DIExpression()), !dbg !409
  %562 = load i8, i8* %163, align 1, !dbg !959, !tbaa !960
  %563 = icmp eq i8 %561, %562, !dbg !962
  br i1 %563, label %564, label %602, !dbg !963

564:                                              ; preds = %559, %554
  %565 = getelementptr inbounds i8, i8* %172, i64 86, !dbg !964
  %566 = load i8, i8* %565, align 2, !dbg !964
  %567 = and i8 %566, 1, !dbg !964
  %568 = icmp eq i8 %567, 0, !dbg !966
  br i1 %568, label %593, label %569, !dbg !967

569:                                              ; preds = %564
  %570 = getelementptr inbounds i8, i8* %172, i64 87, !dbg !968
  %571 = load i8, i8* %570, align 1, !dbg !968, !tbaa !969
  call void @llvm.dbg.value(metadata %struct.icmphdr* %134, metadata !211, metadata !DIExpression()), !dbg !409
  %572 = load i8, i8* %164, align 4, !dbg !970, !tbaa !971
  %573 = icmp eq i8 %571, %572, !dbg !972
  br i1 %573, label %593, label %602, !dbg !973

574:                                              ; preds = %553
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %133, metadata !167, metadata !DIExpression()), !dbg !409
  br i1 %165, label %602, label %575, !dbg !974

575:                                              ; preds = %574
  %576 = and i8 %550, 2, !dbg !975
  %577 = icmp eq i8 %576, 0, !dbg !975
  br i1 %577, label %583, label %578, !dbg !979

578:                                              ; preds = %575
  %579 = getelementptr inbounds i8, i8* %172, i64 85, !dbg !980
  %580 = load i8, i8* %579, align 1, !dbg !980, !tbaa !958
  %581 = load i8, i8* %166, align 1, !dbg !981, !tbaa !982
  %582 = icmp eq i8 %580, %581, !dbg !984
  br i1 %582, label %583, label %602, !dbg !985

583:                                              ; preds = %578, %575
  %584 = getelementptr inbounds i8, i8* %172, i64 86, !dbg !986
  %585 = load i8, i8* %584, align 2, !dbg !986
  %586 = and i8 %585, 1, !dbg !986
  %587 = icmp eq i8 %586, 0, !dbg !988
  br i1 %587, label %593, label %588, !dbg !989

588:                                              ; preds = %583
  %589 = getelementptr inbounds i8, i8* %172, i64 87, !dbg !990
  %590 = load i8, i8* %589, align 1, !dbg !990, !tbaa !969
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %133, metadata !167, metadata !DIExpression()), !dbg !409
  %591 = load i8, i8* %167, align 4, !dbg !991, !tbaa !992
  %592 = icmp eq i8 %590, %591, !dbg !993
  br i1 %592, label %593, label %602, !dbg !994

593:                                              ; preds = %541, %536, %569, %564, %583, %588, %548, %513, %516
  %594 = load i32, i32* %175, align 4, !dbg !995, !tbaa !997
  %595 = getelementptr inbounds i8, i8* %172, i64 5, !dbg !995
  %596 = load i8, i8* %595, align 1, !dbg !995, !tbaa !998
  %597 = zext i8 %596 to i32, !dbg !995
  %598 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @xdp_prog_main.____fmt.2, i64 0, i64 0), i32 noundef 34, i32 noundef %594, i32 noundef %597) #4, !dbg !995
  %599 = load i8, i8* %595, align 1, !dbg !999, !tbaa !998
  %600 = zext i8 %599 to i32, !dbg !1000
  call void @llvm.dbg.value(metadata i32 %600, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 1, metadata !265, metadata !DIExpression()), !dbg !409
  br label %602, !dbg !1001

601:                                              ; preds = %168
  call void @llvm.dbg.value(metadata i32 %170, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %171, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %137) #4, !dbg !1001
  br label %607

602:                                              ; preds = %593, %310, %174, %201, %195, %189, %186, %227, %221, %215, %212, %238, %233, %248, %258, %268, %283, %299, %347, %342, %337, %332, %327, %322, %317, %312, %357, %369, %379, %389, %404, %419, %423, %435, %448, %458, %468, %478, %488, %496, %506, %516, %525, %529, %541, %559, %569, %578, %588, %574
  %603 = phi i32 [ %171, %574 ], [ %171, %588 ], [ %171, %578 ], [ %171, %569 ], [ %171, %559 ], [ %171, %541 ], [ %171, %529 ], [ %171, %525 ], [ %171, %516 ], [ %171, %506 ], [ %171, %496 ], [ %171, %488 ], [ %171, %478 ], [ %171, %468 ], [ %171, %458 ], [ %171, %448 ], [ %171, %435 ], [ %171, %423 ], [ %171, %419 ], [ %171, %404 ], [ %171, %389 ], [ %171, %379 ], [ %171, %369 ], [ %171, %357 ], [ %171, %312 ], [ %171, %317 ], [ %171, %322 ], [ %171, %327 ], [ %171, %332 ], [ %171, %337 ], [ %171, %342 ], [ %171, %347 ], [ %171, %299 ], [ %171, %283 ], [ %171, %268 ], [ %171, %258 ], [ %171, %248 ], [ %171, %233 ], [ %171, %238 ], [ %171, %212 ], [ %171, %215 ], [ %171, %221 ], [ %171, %227 ], [ %171, %186 ], [ %171, %189 ], [ %171, %195 ], [ %171, %201 ], [ %171, %174 ], [ %171, %310 ], [ 1, %593 ]
  %604 = phi i32 [ %170, %574 ], [ %170, %588 ], [ %170, %578 ], [ %170, %569 ], [ %170, %559 ], [ %170, %541 ], [ %170, %529 ], [ %170, %525 ], [ %170, %516 ], [ %170, %506 ], [ %170, %496 ], [ %170, %488 ], [ %170, %478 ], [ %170, %468 ], [ %170, %458 ], [ %170, %448 ], [ %170, %435 ], [ %170, %423 ], [ %170, %419 ], [ %170, %404 ], [ %170, %389 ], [ %170, %379 ], [ %170, %369 ], [ %170, %357 ], [ %170, %312 ], [ %170, %317 ], [ %170, %322 ], [ %170, %327 ], [ %170, %332 ], [ %170, %337 ], [ %170, %342 ], [ %170, %347 ], [ %170, %299 ], [ %170, %283 ], [ %170, %268 ], [ %170, %258 ], [ %170, %248 ], [ %170, %233 ], [ %170, %238 ], [ %170, %212 ], [ %170, %215 ], [ %170, %221 ], [ %170, %227 ], [ %170, %186 ], [ %170, %189 ], [ %170, %195 ], [ %170, %201 ], [ %170, %174 ], [ %170, %310 ], [ %600, %593 ]
  call void @llvm.dbg.value(metadata i32 undef, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 undef, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %137) #4, !dbg !1001
  %605 = add nuw nsw i32 %169, 1, !dbg !1002
  call void @llvm.dbg.value(metadata i32 %604, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %603, metadata !265, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %605, metadata !266, metadata !DIExpression()), !dbg !621
  %606 = icmp eq i32 %605, 80, !dbg !1003
  br i1 %606, label %607, label %168, !dbg !622, !llvm.loop !1004

607:                                              ; preds = %602, %601
  %608 = phi i32 [ %171, %601 ], [ %603, %602 ]
  %609 = phi i32 [ %170, %601 ], [ %604, %602 ]
  call void @llvm.dbg.value(metadata i32 %609, metadata !74, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 %608, metadata !265, metadata !DIExpression()), !dbg !409
  %610 = icmp eq i32 %608, 1, !dbg !1007
  br i1 %610, label %611, label %633, !dbg !1009

611:                                              ; preds = %607
  call void @llvm.dbg.value(metadata i32 0, metadata !265, metadata !DIExpression()), !dbg !409
  %612 = bitcast i32* %3 to i8*, !dbg !1010
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %612), !dbg !1010
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1015, metadata !DIExpression()) #4, !dbg !1010
  call void @llvm.dbg.value(metadata i32 %609, metadata !1016, metadata !DIExpression()) #4, !dbg !1010
  store i32 %609, i32* %3, align 4, !tbaa !626
  %613 = load i32, i32* %5, align 4, !dbg !1023, !tbaa !411
  %614 = zext i32 %613 to i64, !dbg !1024
  call void @llvm.dbg.value(metadata i64 %614, metadata !1017, metadata !DIExpression()) #4, !dbg !1010
  %615 = load i32, i32* %9, align 4, !dbg !1025, !tbaa !419
  %616 = zext i32 %615 to i64, !dbg !1026
  call void @llvm.dbg.value(metadata i64 %616, metadata !1018, metadata !DIExpression()) #4, !dbg !1010
  %617 = icmp ugt i32 %609, 4, !dbg !1027
  br i1 %617, label %631, label %618, !dbg !1029

618:                                              ; preds = %611
  call void @llvm.dbg.value(metadata i32* %3, metadata !1016, metadata !DIExpression(DW_OP_deref)) #4, !dbg !1010
  %619 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.10* @xdp_stats_map to i8*), i8* noundef nonnull %612) #4, !dbg !1030
  call void @llvm.dbg.value(metadata i8* %619, metadata !1019, metadata !DIExpression()) #4, !dbg !1010
  %620 = icmp eq i8* %619, null, !dbg !1031
  br i1 %620, label %631, label %621, !dbg !1033

621:                                              ; preds = %618
  call void @llvm.dbg.value(metadata i8* %619, metadata !1019, metadata !DIExpression()) #4, !dbg !1010
  %622 = sub nsw i64 %614, %616, !dbg !1034
  call void @llvm.dbg.value(metadata i64 %622, metadata !1020, metadata !DIExpression()) #4, !dbg !1010
  %623 = bitcast i8* %619 to i64*, !dbg !1035
  %624 = load i64, i64* %623, align 8, !dbg !1036, !tbaa !1037
  %625 = add i64 %624, 1, !dbg !1036
  store i64 %625, i64* %623, align 8, !dbg !1036, !tbaa !1037
  %626 = getelementptr inbounds i8, i8* %619, i64 8, !dbg !1040
  %627 = bitcast i8* %626 to i64*, !dbg !1040
  %628 = load i64, i64* %627, align 8, !dbg !1041, !tbaa !1042
  %629 = add i64 %622, %628, !dbg !1041
  store i64 %629, i64* %627, align 8, !dbg !1041, !tbaa !1042
  %630 = load i32, i32* %3, align 4, !dbg !1043, !tbaa !626
  call void @llvm.dbg.value(metadata i32 %630, metadata !1016, metadata !DIExpression()) #4, !dbg !1010
  br label %631

631:                                              ; preds = %611, %618, %621
  %632 = phi i32 [ 0, %611 ], [ %630, %621 ], [ 0, %618 ], !dbg !1010
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %612), !dbg !1044
  br label %653, !dbg !1045

633:                                              ; preds = %607
  %634 = bitcast i32* %2 to i8*, !dbg !1046
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %634), !dbg !1046
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1015, metadata !DIExpression()) #4, !dbg !1046
  call void @llvm.dbg.value(metadata i32 2, metadata !1016, metadata !DIExpression()) #4, !dbg !1046
  store i32 2, i32* %2, align 4, !tbaa !626
  %635 = load i32, i32* %5, align 4, !dbg !1048, !tbaa !411
  call void @llvm.dbg.value(metadata i32 %635, metadata !1017, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #4, !dbg !1046
  %636 = load i32, i32* %9, align 4, !dbg !1049, !tbaa !419
  call void @llvm.dbg.value(metadata i32 %636, metadata !1018, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #4, !dbg !1046
  call void @llvm.dbg.value(metadata i32* %2, metadata !1016, metadata !DIExpression(DW_OP_deref)) #4, !dbg !1046
  %637 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.10* @xdp_stats_map to i8*), i8* noundef nonnull %634) #4, !dbg !1050
  call void @llvm.dbg.value(metadata i8* %637, metadata !1019, metadata !DIExpression()) #4, !dbg !1046
  %638 = icmp eq i8* %637, null, !dbg !1051
  br i1 %638, label %651, label %639, !dbg !1052

639:                                              ; preds = %633
  %640 = zext i32 %636 to i64, !dbg !1053
  call void @llvm.dbg.value(metadata i64 %640, metadata !1018, metadata !DIExpression()) #4, !dbg !1046
  %641 = zext i32 %635 to i64, !dbg !1054
  call void @llvm.dbg.value(metadata i64 %641, metadata !1017, metadata !DIExpression()) #4, !dbg !1046
  call void @llvm.dbg.value(metadata i8* %637, metadata !1019, metadata !DIExpression()) #4, !dbg !1046
  %642 = sub nsw i64 %641, %640, !dbg !1055
  call void @llvm.dbg.value(metadata i64 %642, metadata !1020, metadata !DIExpression()) #4, !dbg !1046
  %643 = bitcast i8* %637 to i64*, !dbg !1056
  %644 = load i64, i64* %643, align 8, !dbg !1057, !tbaa !1037
  %645 = add i64 %644, 1, !dbg !1057
  store i64 %645, i64* %643, align 8, !dbg !1057, !tbaa !1037
  %646 = getelementptr inbounds i8, i8* %637, i64 8, !dbg !1058
  %647 = bitcast i8* %646 to i64*, !dbg !1058
  %648 = load i64, i64* %647, align 8, !dbg !1059, !tbaa !1042
  %649 = add i64 %642, %648, !dbg !1059
  store i64 %649, i64* %647, align 8, !dbg !1059, !tbaa !1042
  %650 = load i32, i32* %2, align 4, !dbg !1060, !tbaa !626
  call void @llvm.dbg.value(metadata i32 %650, metadata !1016, metadata !DIExpression()) #4, !dbg !1046
  br label %651

651:                                              ; preds = %633, %639
  %652 = phi i32 [ %650, %639 ], [ 0, %633 ], !dbg !1046
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %634), !dbg !1061
  br label %653, !dbg !1062

653:                                              ; preds = %88, %29, %651, %631
  %654 = phi i32 [ %632, %631 ], [ %652, %651 ], [ 2, %29 ], [ 2, %88 ], !dbg !409
  ret i32 %654, !dbg !1063
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!404, !405, !406, !407}
!llvm.ident = !{!408}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "filters_map", scope: !2, file: !3, line: 49, type: !392, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !53, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/yujie/Desktop/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "2f231ce0452c904fbf12bd79ec91bcec")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5431, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "5ad8bc925dae1ec87bbb04b3148b183b")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!41 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!42 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!43 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!45 = !{!46, !47, !48, !51}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !49, line: 24, baseType: !50)
!49 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !52, line: 25, baseType: !48)
!52 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!53 = !{!54, !343, !348, !353, !356, !0, !378, !386}
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "____fmt", scope: !56, file: !3, line: 437, type: !340, isLocal: true, isDefinition: true)
!56 = distinct !DISubprogram(name: "xdp_prog_main", scope: !3, file: !3, line: 223, type: !57, scopeLine: 224, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !70)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5442, size: 192, elements: !62)
!62 = !{!63, !65, !66, !67, !68, !69}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !61, file: !6, line: 5443, baseType: !64, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !61, file: !6, line: 5444, baseType: !64, size: 32, offset: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !61, file: !6, line: 5445, baseType: !64, size: 32, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !61, file: !6, line: 5447, baseType: !64, size: 32, offset: 96)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !61, file: !6, line: 5448, baseType: !64, size: 32, offset: 128)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !61, file: !6, line: 5450, baseType: !64, size: 32, offset: 160)
!70 = !{!71, !72, !73, !74, !75, !79, !80, !92, !139, !167, !211, !234, !256, !265, !266, !268, !271}
!71 = !DILocalVariable(name: "ctx", arg: 1, scope: !56, file: !3, line: 223, type: !60)
!72 = !DILocalVariable(name: "data_end", scope: !56, file: !3, line: 225, type: !46)
!73 = !DILocalVariable(name: "data", scope: !56, file: !3, line: 226, type: !46)
!74 = !DILocalVariable(name: "action", scope: !56, file: !3, line: 233, type: !64)
!75 = !DILocalVariable(name: "nh", scope: !56, file: !3, line: 236, type: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3, line: 17, size: 64, elements: !77)
!77 = !{!78}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !76, file: !3, line: 18, baseType: !46, size: 64)
!79 = !DILocalVariable(name: "nh_type", scope: !56, file: !3, line: 237, type: !59)
!80 = !DILocalVariable(name: "eth", scope: !56, file: !3, line: 240, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !83, line: 168, size: 112, elements: !84)
!83 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!84 = !{!85, !90, !91}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !82, file: !83, line: 169, baseType: !86, size: 48)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 48, elements: !88)
!87 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!88 = !{!89}
!89 = !DISubrange(count: 6)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !82, file: !83, line: 170, baseType: !86, size: 48, offset: 48)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !82, file: !83, line: 171, baseType: !51, size: 16, offset: 96)
!92 = !DILocalVariable(name: "ip6h", scope: !56, file: !3, line: 241, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !95, line: 118, size: 320, elements: !96)
!95 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!96 = !{!97, !99, !100, !104, !105, !106, !107}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !94, file: !95, line: 120, baseType: !98, size: 4, flags: DIFlagBitField, extraData: i64 0)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !49, line: 21, baseType: !87)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !94, file: !95, line: 121, baseType: !98, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !94, file: !95, line: 128, baseType: !101, size: 24, offset: 8)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 24, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 3)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !94, file: !95, line: 130, baseType: !51, size: 16, offset: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !94, file: !95, line: 131, baseType: !98, size: 8, offset: 48)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !94, file: !95, line: 132, baseType: !98, size: 8, offset: 56)
!107 = !DIDerivedType(tag: DW_TAG_member, scope: !94, file: !95, line: 134, baseType: !108, size: 256, offset: 64)
!108 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !94, file: !95, line: 134, size: 256, elements: !109)
!109 = !{!110, !134}
!110 = !DIDerivedType(tag: DW_TAG_member, scope: !108, file: !95, line: 134, baseType: !111, size: 256)
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !108, file: !95, line: 134, size: 256, elements: !112)
!112 = !{!113, !133}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !111, file: !95, line: 134, baseType: !114, size: 128)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !115, line: 33, size: 128, elements: !116)
!115 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!116 = !{!117}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !114, file: !115, line: 40, baseType: !118, size: 128)
!118 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !114, file: !115, line: 34, size: 128, elements: !119)
!119 = !{!120, !124, !128}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !118, file: !115, line: 35, baseType: !121, size: 128)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 128, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 16)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !118, file: !115, line: 37, baseType: !125, size: 128)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 8)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !118, file: !115, line: 38, baseType: !129, size: 128)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 128, elements: !131)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !52, line: 27, baseType: !64)
!131 = !{!132}
!132 = !DISubrange(count: 4)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !111, file: !95, line: 134, baseType: !114, size: 128, offset: 128)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !108, file: !95, line: 134, baseType: !135, size: 256)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !108, file: !95, line: 134, size: 256, elements: !136)
!136 = !{!137, !138}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !135, file: !95, line: 134, baseType: !114, size: 128)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !135, file: !95, line: 134, baseType: !114, size: 128, offset: 128)
!139 = !DILocalVariable(name: "iph", scope: !56, file: !3, line: 242, type: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !142, line: 87, size: 160, elements: !143)
!142 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!143 = !{!144, !145, !146, !147, !148, !149, !150, !151, !152, !154}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !141, file: !142, line: 89, baseType: !98, size: 4, flags: DIFlagBitField, extraData: i64 0)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !141, file: !142, line: 90, baseType: !98, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !141, file: !142, line: 97, baseType: !98, size: 8, offset: 8)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !141, file: !142, line: 98, baseType: !51, size: 16, offset: 16)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !141, file: !142, line: 99, baseType: !51, size: 16, offset: 32)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !141, file: !142, line: 100, baseType: !51, size: 16, offset: 48)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !141, file: !142, line: 101, baseType: !98, size: 8, offset: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !141, file: !142, line: 102, baseType: !98, size: 8, offset: 72)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !141, file: !142, line: 103, baseType: !153, size: 16, offset: 80)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !52, line: 31, baseType: !48)
!154 = !DIDerivedType(tag: DW_TAG_member, scope: !141, file: !142, line: 104, baseType: !155, size: 64, offset: 96)
!155 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !141, file: !142, line: 104, size: 64, elements: !156)
!156 = !{!157, !162}
!157 = !DIDerivedType(tag: DW_TAG_member, scope: !155, file: !142, line: 104, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !142, line: 104, size: 64, elements: !159)
!159 = !{!160, !161}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !158, file: !142, line: 104, baseType: !130, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !158, file: !142, line: 104, baseType: !130, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !155, file: !142, line: 104, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !142, line: 104, size: 64, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !163, file: !142, line: 104, baseType: !130, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !163, file: !142, line: 104, baseType: !130, size: 32, offset: 32)
!167 = !DILocalVariable(name: "icmp6h", scope: !56, file: !3, line: 243, type: !168)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !170, line: 8, size: 64, elements: !171)
!170 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!171 = !{!172, !173, !174, !175}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !169, file: !170, line: 10, baseType: !98, size: 8)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !169, file: !170, line: 11, baseType: !98, size: 8, offset: 8)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !169, file: !170, line: 12, baseType: !153, size: 16, offset: 16)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !169, file: !170, line: 63, baseType: !176, size: 32, offset: 32)
!176 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !169, file: !170, line: 15, size: 32, elements: !177)
!177 = !{!178, !182, !186, !188, !193, !201}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !176, file: !170, line: 16, baseType: !179, size: 32)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 32, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 1)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !176, file: !170, line: 17, baseType: !183, size: 32)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 32, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 2)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !176, file: !170, line: 18, baseType: !187, size: 32)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 32, elements: !131)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !176, file: !170, line: 23, baseType: !189, size: 32)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !170, line: 20, size: 32, elements: !190)
!190 = !{!191, !192}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !189, file: !170, line: 21, baseType: !51, size: 16)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !189, file: !170, line: 22, baseType: !51, size: 16, offset: 16)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !176, file: !170, line: 40, baseType: !194, size: 32)
!194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !170, line: 25, size: 32, elements: !195)
!195 = !{!196, !197, !198, !199, !200}
!196 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !194, file: !170, line: 27, baseType: !64, size: 5, flags: DIFlagBitField, extraData: i64 0)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !194, file: !170, line: 28, baseType: !64, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !194, file: !170, line: 29, baseType: !64, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !194, file: !170, line: 30, baseType: !64, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !194, file: !170, line: 31, baseType: !64, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !176, file: !170, line: 61, baseType: !202, size: 32)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !170, line: 42, size: 32, elements: !203)
!203 = !{!204, !205, !206, !207, !208, !209, !210}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !202, file: !170, line: 43, baseType: !98, size: 8)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !202, file: !170, line: 45, baseType: !98, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !202, file: !170, line: 46, baseType: !98, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !202, file: !170, line: 47, baseType: !98, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !202, file: !170, line: 48, baseType: !98, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !202, file: !170, line: 49, baseType: !98, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !202, file: !170, line: 60, baseType: !51, size: 16, offset: 16)
!211 = !DILocalVariable(name: "icmph", scope: !56, file: !3, line: 244, type: !212)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !214, line: 89, size: 64, elements: !215)
!214 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!215 = !{!216, !217, !218, !219}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !213, file: !214, line: 90, baseType: !98, size: 8)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !213, file: !214, line: 91, baseType: !98, size: 8, offset: 8)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !213, file: !214, line: 92, baseType: !153, size: 16, offset: 16)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !213, file: !214, line: 104, baseType: !220, size: 32, offset: 32)
!220 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !213, file: !214, line: 93, size: 32, elements: !221)
!221 = !{!222, !227, !228, !233}
!222 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !220, file: !214, line: 97, baseType: !223, size: 32)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !220, file: !214, line: 94, size: 32, elements: !224)
!224 = !{!225, !226}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !223, file: !214, line: 95, baseType: !51, size: 16)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !223, file: !214, line: 96, baseType: !51, size: 16, offset: 16)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !220, file: !214, line: 98, baseType: !130, size: 32)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !220, file: !214, line: 102, baseType: !229, size: 32)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !220, file: !214, line: 99, size: 32, elements: !230)
!230 = !{!231, !232}
!231 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !229, file: !214, line: 100, baseType: !51, size: 16)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !229, file: !214, line: 101, baseType: !51, size: 16, offset: 16)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !220, file: !214, line: 103, baseType: !187, size: 32)
!234 = !DILocalVariable(name: "tcph", scope: !56, file: !3, line: 245, type: !235)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !237, line: 25, size: 160, elements: !238)
!237 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!238 = !{!239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255}
!239 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !236, file: !237, line: 26, baseType: !51, size: 16)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !236, file: !237, line: 27, baseType: !51, size: 16, offset: 16)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !236, file: !237, line: 28, baseType: !130, size: 32, offset: 32)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !236, file: !237, line: 29, baseType: !130, size: 32, offset: 64)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !236, file: !237, line: 31, baseType: !48, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !236, file: !237, line: 32, baseType: !48, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !236, file: !237, line: 33, baseType: !48, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !236, file: !237, line: 34, baseType: !48, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !236, file: !237, line: 35, baseType: !48, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !236, file: !237, line: 36, baseType: !48, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !236, file: !237, line: 37, baseType: !48, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !236, file: !237, line: 38, baseType: !48, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !236, file: !237, line: 39, baseType: !48, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !236, file: !237, line: 40, baseType: !48, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !236, file: !237, line: 55, baseType: !51, size: 16, offset: 112)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !236, file: !237, line: 56, baseType: !153, size: 16, offset: 128)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !236, file: !237, line: 57, baseType: !51, size: 16, offset: 144)
!256 = !DILocalVariable(name: "udph", scope: !56, file: !3, line: 246, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !259, line: 23, size: 64, elements: !260)
!259 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!260 = !{!261, !262, !263, !264}
!261 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !258, file: !259, line: 24, baseType: !51, size: 16)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !258, file: !259, line: 25, baseType: !51, size: 16, offset: 16)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !258, file: !259, line: 26, baseType: !51, size: 16, offset: 32)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !258, file: !259, line: 27, baseType: !153, size: 16, offset: 48)
!265 = !DILocalVariable(name: "flag", scope: !56, file: !3, line: 249, type: !59)
!266 = !DILocalVariable(name: "i", scope: !267, file: !3, line: 353, type: !98)
!267 = distinct !DILexicalBlock(scope: !56, file: !3, line: 353, column: 2)
!268 = !DILocalVariable(name: "key", scope: !269, file: !3, line: 355, type: !64)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 354, column: 2)
!270 = distinct !DILexicalBlock(scope: !267, file: !3, line: 353, column: 2)
!271 = !DILocalVariable(name: "filter", scope: !269, file: !3, line: 356, type: !272)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "filter", file: !274, line: 124, size: 704, elements: !275)
!274 = !DIFile(filename: "./xdpfw.h", directory: "/home/yujie/Desktop/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "a4cd2523f7654f0445c9de9faf4c3ff4")
!275 = !{!276, !277, !278, !279, !280, !281, !282, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !300, !324, !332}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !273, file: !274, line: 126, baseType: !64, size: 32)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !273, file: !274, line: 127, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "action", scope: !273, file: !274, line: 129, baseType: !98, size: 8, offset: 40)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "ip_enabled", scope: !273, file: !274, line: 131, baseType: !7, size: 1, offset: 48, flags: DIFlagBitField, extraData: i64 48)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "srcip", scope: !273, file: !274, line: 132, baseType: !64, size: 32, offset: 64)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "dstip", scope: !273, file: !274, line: 133, baseType: !64, size: 32, offset: 96)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "srcip6", scope: !273, file: !274, line: 135, baseType: !283, size: 128, offset: 128)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 128, elements: !131)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "dstip6", scope: !273, file: !274, line: 136, baseType: !283, size: 128, offset: 256)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "do_min_ttl", scope: !273, file: !274, line: 138, baseType: !7, size: 1, offset: 384, flags: DIFlagBitField, extraData: i64 384)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "min_ttl", scope: !273, file: !274, line: 139, baseType: !98, size: 8, offset: 392)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "do_max_ttl", scope: !273, file: !274, line: 141, baseType: !7, size: 1, offset: 400, flags: DIFlagBitField, extraData: i64 400)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "max_ttl", scope: !273, file: !274, line: 142, baseType: !98, size: 8, offset: 408)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "do_min_len", scope: !273, file: !274, line: 144, baseType: !7, size: 1, offset: 416, flags: DIFlagBitField, extraData: i64 416)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "min_len", scope: !273, file: !274, line: 145, baseType: !48, size: 16, offset: 432)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "do_max_len", scope: !273, file: !274, line: 147, baseType: !7, size: 1, offset: 448, flags: DIFlagBitField, extraData: i64 448)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "max_len", scope: !273, file: !274, line: 148, baseType: !48, size: 16, offset: 464)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "do_tos", scope: !273, file: !274, line: 150, baseType: !7, size: 1, offset: 480, flags: DIFlagBitField, extraData: i64 480)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !273, file: !274, line: 151, baseType: !295, size: 8, offset: 488)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !296, line: 24, baseType: !297)
!296 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!297 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !298, line: 37, baseType: !299)
!298 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!299 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "tcpopts", scope: !273, file: !274, line: 153, baseType: !301, size: 96, offset: 512)
!301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcpopts", file: !274, line: 67, size: 96, elements: !302)
!302 = !{!303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323}
!303 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !301, file: !274, line: 69, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "do_sport", scope: !301, file: !274, line: 71, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !301, file: !274, line: 72, baseType: !48, size: 16, offset: 16)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "do_dport", scope: !301, file: !274, line: 74, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !301, file: !274, line: 75, baseType: !48, size: 16, offset: 48)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "do_urg", scope: !301, file: !274, line: 77, baseType: !7, size: 1, offset: 64, flags: DIFlagBitField, extraData: i64 64)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !301, file: !274, line: 78, baseType: !7, size: 1, offset: 65, flags: DIFlagBitField, extraData: i64 64)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "do_ack", scope: !301, file: !274, line: 80, baseType: !7, size: 1, offset: 66, flags: DIFlagBitField, extraData: i64 64)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !301, file: !274, line: 81, baseType: !7, size: 1, offset: 67, flags: DIFlagBitField, extraData: i64 64)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "do_rst", scope: !301, file: !274, line: 83, baseType: !7, size: 1, offset: 68, flags: DIFlagBitField, extraData: i64 64)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !301, file: !274, line: 84, baseType: !7, size: 1, offset: 69, flags: DIFlagBitField, extraData: i64 64)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "do_psh", scope: !301, file: !274, line: 86, baseType: !7, size: 1, offset: 70, flags: DIFlagBitField, extraData: i64 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !301, file: !274, line: 87, baseType: !7, size: 1, offset: 71, flags: DIFlagBitField, extraData: i64 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "do_syn", scope: !301, file: !274, line: 89, baseType: !7, size: 1, offset: 72, flags: DIFlagBitField, extraData: i64 64)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !301, file: !274, line: 90, baseType: !7, size: 1, offset: 73, flags: DIFlagBitField, extraData: i64 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "do_fin", scope: !301, file: !274, line: 92, baseType: !7, size: 1, offset: 74, flags: DIFlagBitField, extraData: i64 64)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !301, file: !274, line: 93, baseType: !7, size: 1, offset: 75, flags: DIFlagBitField, extraData: i64 64)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "do_ece", scope: !301, file: !274, line: 95, baseType: !7, size: 1, offset: 76, flags: DIFlagBitField, extraData: i64 64)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !301, file: !274, line: 96, baseType: !7, size: 1, offset: 77, flags: DIFlagBitField, extraData: i64 64)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "do_cwr", scope: !301, file: !274, line: 98, baseType: !7, size: 1, offset: 78, flags: DIFlagBitField, extraData: i64 64)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !301, file: !274, line: 99, baseType: !7, size: 1, offset: 79, flags: DIFlagBitField, extraData: i64 64)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "udpopts", scope: !273, file: !274, line: 154, baseType: !325, size: 64, offset: 608)
!325 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udpopts", file: !274, line: 102, size: 64, elements: !326)
!326 = !{!327, !328, !329, !330, !331}
!327 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !325, file: !274, line: 104, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "do_sport", scope: !325, file: !274, line: 106, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !325, file: !274, line: 107, baseType: !48, size: 16, offset: 16)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "do_dport", scope: !325, file: !274, line: 109, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !325, file: !274, line: 110, baseType: !48, size: 16, offset: 48)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "icmpopts", scope: !273, file: !274, line: 155, baseType: !333, size: 32, offset: 672)
!333 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpopts", file: !274, line: 113, size: 32, elements: !334)
!334 = !{!335, !336, !337, !338, !339}
!335 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !333, file: !274, line: 115, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "do_code", scope: !333, file: !274, line: 117, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !333, file: !274, line: 118, baseType: !98, size: 8, offset: 8)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "do_type", scope: !333, file: !274, line: 120, baseType: !7, size: 1, offset: 16, flags: DIFlagBitField, extraData: i64 16)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !333, file: !274, line: 121, baseType: !98, size: 8, offset: 24)
!340 = !DICompositeType(tag: DW_TAG_array_type, baseType: !341, size: 128, elements: !122)
!341 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !342)
!342 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!343 = !DIGlobalVariableExpression(var: !344, expr: !DIExpression())
!344 = distinct !DIGlobalVariable(name: "____fmt", scope: !56, file: !3, line: 577, type: !345, isLocal: true, isDefinition: true)
!345 = !DICompositeType(tag: DW_TAG_array_type, baseType: !341, size: 56, elements: !346)
!346 = !{!347}
!347 = !DISubrange(count: 7)
!348 = !DIGlobalVariableExpression(var: !349, expr: !DIExpression())
!349 = distinct !DIGlobalVariable(name: "____fmt", scope: !56, file: !3, line: 611, type: !350, isLocal: true, isDefinition: true)
!350 = !DICompositeType(tag: DW_TAG_array_type, baseType: !341, size: 272, elements: !351)
!351 = !{!352}
!352 = !DISubrange(count: 34)
!353 = !DIGlobalVariableExpression(var: !354, expr: !DIExpression())
!354 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 630, type: !355, isLocal: false, isDefinition: true)
!355 = !DICompositeType(tag: DW_TAG_array_type, baseType: !342, size: 32, elements: !131)
!356 = !DIGlobalVariableExpression(var: !357, expr: !DIExpression())
!357 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 41, type: !358, isLocal: false, isDefinition: true)
!358 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 36, size: 256, elements: !359)
!359 = !{!360, !363, !365, !373}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !358, file: !3, line: 37, baseType: !361, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!362 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 192, elements: !88)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !358, file: !3, line: 38, baseType: !364, size: 64, offset: 64)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !358, file: !3, line: 39, baseType: !366, size: 64, offset: 128)
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !367, size: 64)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !274, line: 53, size: 128, elements: !368)
!368 = !{!369, !372}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !367, file: !274, line: 54, baseType: !370, size: 64)
!370 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !49, line: 31, baseType: !371)
!371 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !367, file: !274, line: 55, baseType: !370, size: 64, offset: 64)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !358, file: !3, line: 40, baseType: !374, size: 64, offset: 192)
!374 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !375, size: 64)
!375 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 160, elements: !376)
!376 = !{!377}
!377 = !DISubrange(count: 5)
!378 = !DIGlobalVariableExpression(var: !379, expr: !DIExpression())
!379 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !380, line: 56, type: !381, isLocal: true, isDefinition: true)
!380 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/yujie/Desktop/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!382 = !DISubroutineType(types: !383)
!383 = !{!46, !46, !384}
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!385 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!386 = !DIGlobalVariableExpression(var: !387, expr: !DIExpression())
!387 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !380, line: 177, type: !388, isLocal: true, isDefinition: true)
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!389 = !DISubroutineType(types: !390)
!390 = !{!47, !391, !64, null}
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 43, size: 256, elements: !393)
!393 = !{!394, !397, !402, !403}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !392, file: !3, line: 45, baseType: !395, size: 64)
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !396, size: 64)
!396 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 64, elements: !184)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !392, file: !3, line: 46, baseType: !398, size: 64, offset: 64)
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64)
!399 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 2560, elements: !400)
!400 = !{!401}
!401 = !DISubrange(count: 80)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !392, file: !3, line: 47, baseType: !364, size: 64, offset: 128)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !392, file: !3, line: 48, baseType: !272, size: 64, offset: 192)
!404 = !{i32 7, !"Dwarf Version", i32 5}
!405 = !{i32 2, !"Debug Info Version", i32 3}
!406 = !{i32 1, !"wchar_size", i32 4}
!407 = !{i32 7, !"frame-pointer", i32 2}
!408 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!409 = !DILocation(line: 0, scope: !56)
!410 = !DILocation(line: 225, column: 38, scope: !56)
!411 = !{!412, !413, i64 4}
!412 = !{!"xdp_md", !413, i64 0, !413, i64 4, !413, i64 8, !413, i64 12, !413, i64 16, !413, i64 20}
!413 = !{!"int", !414, i64 0}
!414 = !{!"omnipotent char", !415, i64 0}
!415 = !{!"Simple C/C++ TBAA"}
!416 = !DILocation(line: 225, column: 27, scope: !56)
!417 = !DILocation(line: 225, column: 19, scope: !56)
!418 = !DILocation(line: 226, column: 34, scope: !56)
!419 = !{!412, !413, i64 0}
!420 = !DILocation(line: 226, column: 23, scope: !56)
!421 = !DILocation(line: 226, column: 15, scope: !56)
!422 = !DILocalVariable(name: "nh", arg: 1, scope: !423, file: !3, line: 51, type: !426)
!423 = distinct !DISubprogram(name: "parse_ethhdr", scope: !3, file: !3, line: 51, type: !424, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !428)
!424 = !DISubroutineType(types: !425)
!425 = !{!59, !426, !46, !427}
!426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!428 = !{!422, !429, !430, !431, !432}
!429 = !DILocalVariable(name: "data_end", arg: 2, scope: !423, file: !3, line: 52, type: !46)
!430 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !423, file: !3, line: 53, type: !427)
!431 = !DILocalVariable(name: "eth", scope: !423, file: !3, line: 55, type: !81)
!432 = !DILocalVariable(name: "hdrsize", scope: !423, file: !3, line: 56, type: !59)
!433 = !DILocation(line: 0, scope: !423, inlinedAt: !434)
!434 = distinct !DILocation(line: 259, column: 15, scope: !56)
!435 = !DILocation(line: 61, column: 10, scope: !436, inlinedAt: !434)
!436 = distinct !DILexicalBlock(scope: !423, file: !3, line: 61, column: 6)
!437 = !DILocation(line: 61, column: 14, scope: !436, inlinedAt: !434)
!438 = !DILocation(line: 61, column: 6, scope: !423, inlinedAt: !434)
!439 = !DILocation(line: 67, column: 14, scope: !423, inlinedAt: !434)
!440 = !{!441, !442, i64 12}
!441 = !{!"ethhdr", !414, i64 0, !414, i64 6, !442, i64 12}
!442 = !{!"short", !414, i64 0}
!443 = !DILocation(line: 261, column: 6, scope: !56)
!444 = !DILocalVariable(name: "nh", arg: 1, scope: !445, file: !3, line: 70, type: !426)
!445 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !3, file: !3, line: 70, type: !446, scopeLine: 73, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !449)
!446 = !DISubroutineType(types: !447)
!447 = !{!59, !426, !46, !448}
!448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!449 = !{!444, !450, !451, !452}
!450 = !DILocalVariable(name: "data_end", arg: 2, scope: !445, file: !3, line: 71, type: !46)
!451 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !445, file: !3, line: 72, type: !448)
!452 = !DILocalVariable(name: "ip6h", scope: !445, file: !3, line: 74, type: !93)
!453 = !DILocation(line: 0, scope: !445, inlinedAt: !454)
!454 = distinct !DILocation(line: 263, column: 13, scope: !455)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 261, column: 40)
!456 = distinct !DILexicalBlock(scope: !56, file: !3, line: 261, column: 6)
!457 = !DILocation(line: 80, column: 11, scope: !458, inlinedAt: !454)
!458 = distinct !DILexicalBlock(scope: !445, file: !3, line: 80, column: 6)
!459 = !DILocation(line: 80, column: 17, scope: !458, inlinedAt: !454)
!460 = !DILocation(line: 80, column: 15, scope: !458, inlinedAt: !454)
!461 = !DILocation(line: 80, column: 6, scope: !445, inlinedAt: !454)
!462 = !DILocation(line: 74, column: 29, scope: !445, inlinedAt: !454)
!463 = !DILocation(line: 86, column: 15, scope: !445, inlinedAt: !454)
!464 = !{!465, !414, i64 6}
!465 = !{!"ipv6hdr", !414, i64 0, !414, i64 0, !414, i64 1, !442, i64 4, !414, i64 6, !414, i64 7, !414, i64 8}
!466 = !DILocation(line: 86, column: 9, scope: !445, inlinedAt: !454)
!467 = !DILocation(line: 86, column: 2, scope: !445, inlinedAt: !454)
!468 = !DILocation(line: 264, column: 6, scope: !469)
!469 = distinct !DILexicalBlock(scope: !455, file: !3, line: 264, column: 6)
!470 = !DILocation(line: 264, column: 11, scope: !469)
!471 = !DILocation(line: 279, column: 3, scope: !455)
!472 = !DILocalVariable(name: "nh", arg: 1, scope: !473, file: !3, line: 164, type: !426)
!473 = distinct !DISubprogram(name: "parse_tcphdr", scope: !3, file: !3, line: 164, type: !474, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !477)
!474 = !DISubroutineType(types: !475)
!475 = !{!59, !426, !46, !476}
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!477 = !{!472, !478, !479, !480, !481}
!478 = !DILocalVariable(name: "data_end", arg: 2, scope: !473, file: !3, line: 165, type: !46)
!479 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !473, file: !3, line: 166, type: !476)
!480 = !DILocalVariable(name: "len", scope: !473, file: !3, line: 168, type: !59)
!481 = !DILocalVariable(name: "h", scope: !473, file: !3, line: 169, type: !235)
!482 = !DILocation(line: 0, scope: !473, inlinedAt: !483)
!483 = distinct !DILocation(line: 283, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !455, file: !3, line: 280, column: 9)
!485 = !DILocation(line: 171, column: 8, scope: !486, inlinedAt: !483)
!486 = distinct !DILexicalBlock(scope: !473, file: !3, line: 171, column: 6)
!487 = !DILocation(line: 171, column: 12, scope: !486, inlinedAt: !483)
!488 = !DILocation(line: 171, column: 6, scope: !473, inlinedAt: !483)
!489 = !DILocation(line: 174, column: 11, scope: !473, inlinedAt: !483)
!490 = !DILocation(line: 174, column: 16, scope: !473, inlinedAt: !483)
!491 = !DILocation(line: 176, column: 9, scope: !492, inlinedAt: !483)
!492 = distinct !DILexicalBlock(scope: !473, file: !3, line: 176, column: 5)
!493 = !DILocation(line: 176, column: 5, scope: !473, inlinedAt: !483)
!494 = !DILocation(line: 180, column: 14, scope: !495, inlinedAt: !483)
!495 = distinct !DILexicalBlock(scope: !473, file: !3, line: 180, column: 6)
!496 = !DILocation(line: 180, column: 20, scope: !495, inlinedAt: !483)
!497 = !DILocation(line: 180, column: 6, scope: !473, inlinedAt: !483)
!498 = !DILocation(line: 188, column: 10, scope: !473, inlinedAt: !483)
!499 = !DILocation(line: 190, column: 2, scope: !473, inlinedAt: !483)
!500 = !DILocalVariable(name: "nh", arg: 1, scope: !501, file: !3, line: 144, type: !426)
!501 = distinct !DISubprogram(name: "parse_udphdr", scope: !3, file: !3, line: 144, type: !502, scopeLine: 147, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !505)
!502 = !DISubroutineType(types: !503)
!503 = !{!59, !426, !46, !504}
!504 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!505 = !{!500, !506, !507, !508, !509}
!506 = !DILocalVariable(name: "data_end", arg: 2, scope: !501, file: !3, line: 145, type: !46)
!507 = !DILocalVariable(name: "udphdr", arg: 3, scope: !501, file: !3, line: 146, type: !504)
!508 = !DILocalVariable(name: "len", scope: !501, file: !3, line: 148, type: !59)
!509 = !DILocalVariable(name: "h", scope: !501, file: !3, line: 149, type: !257)
!510 = !DILocation(line: 0, scope: !501, inlinedAt: !511)
!511 = distinct !DILocation(line: 293, column: 17, scope: !484)
!512 = !DILocation(line: 151, column: 8, scope: !513, inlinedAt: !511)
!513 = distinct !DILexicalBlock(scope: !501, file: !3, line: 151, column: 6)
!514 = !DILocation(line: 151, column: 14, scope: !513, inlinedAt: !511)
!515 = !DILocation(line: 151, column: 12, scope: !513, inlinedAt: !511)
!516 = !DILocation(line: 151, column: 6, scope: !501, inlinedAt: !511)
!517 = !DILocation(line: 149, column: 25, scope: !501, inlinedAt: !511)
!518 = !DILocation(line: 158, column: 6, scope: !501, inlinedAt: !511)
!519 = !DILocalVariable(name: "nh", arg: 1, scope: !520, file: !3, line: 89, type: !426)
!520 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !3, file: !3, line: 89, type: !521, scopeLine: 92, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !524)
!521 = !DISubroutineType(types: !522)
!522 = !{!59, !426, !46, !523}
!523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!524 = !{!519, !525, !526, !527}
!525 = !DILocalVariable(name: "data_end", arg: 2, scope: !520, file: !3, line: 90, type: !46)
!526 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !520, file: !3, line: 91, type: !523)
!527 = !DILocalVariable(name: "icmp6h", scope: !520, file: !3, line: 93, type: !168)
!528 = !DILocation(line: 0, scope: !520, inlinedAt: !529)
!529 = distinct !DILocation(line: 301, column: 17, scope: !484)
!530 = !DILocation(line: 95, column: 13, scope: !531, inlinedAt: !529)
!531 = distinct !DILexicalBlock(scope: !520, file: !3, line: 95, column: 6)
!532 = !DILocation(line: 95, column: 19, scope: !531, inlinedAt: !529)
!533 = !DILocation(line: 95, column: 17, scope: !531, inlinedAt: !529)
!534 = !DILocation(line: 95, column: 6, scope: !520, inlinedAt: !529)
!535 = !DILocation(line: 93, column: 32, scope: !520, inlinedAt: !529)
!536 = !DILocation(line: 101, column: 2, scope: !520, inlinedAt: !529)
!537 = !DILocalVariable(name: "nh", arg: 1, scope: !538, file: !3, line: 104, type: !426)
!538 = distinct !DISubprogram(name: "parse_iphdr", scope: !3, file: !3, line: 104, type: !539, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !542)
!539 = !DISubroutineType(types: !540)
!540 = !{!59, !426, !46, !541}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!542 = !{!537, !543, !544, !545, !546}
!543 = !DILocalVariable(name: "data_end", arg: 2, scope: !538, file: !3, line: 105, type: !46)
!544 = !DILocalVariable(name: "iphdr", arg: 3, scope: !538, file: !3, line: 106, type: !541)
!545 = !DILocalVariable(name: "iph", scope: !538, file: !3, line: 108, type: !140)
!546 = !DILocalVariable(name: "hdrsize", scope: !538, file: !3, line: 109, type: !59)
!547 = !DILocation(line: 0, scope: !538, inlinedAt: !548)
!548 = distinct !DILocation(line: 308, column: 13, scope: !549)
!549 = distinct !DILexicalBlock(scope: !550, file: !3, line: 306, column: 45)
!550 = distinct !DILexicalBlock(scope: !456, file: !3, line: 306, column: 13)
!551 = !DILocation(line: 111, column: 10, scope: !552, inlinedAt: !548)
!552 = distinct !DILexicalBlock(scope: !538, file: !3, line: 111, column: 6)
!553 = !DILocation(line: 111, column: 14, scope: !552, inlinedAt: !548)
!554 = !DILocation(line: 111, column: 6, scope: !538, inlinedAt: !548)
!555 = !DILocation(line: 114, column: 17, scope: !538, inlinedAt: !548)
!556 = !DILocation(line: 114, column: 21, scope: !538, inlinedAt: !548)
!557 = !DILocation(line: 116, column: 13, scope: !558, inlinedAt: !548)
!558 = distinct !DILexicalBlock(scope: !538, file: !3, line: 116, column: 5)
!559 = !DILocation(line: 116, column: 5, scope: !538, inlinedAt: !548)
!560 = !DILocation(line: 120, column: 14, scope: !561, inlinedAt: !548)
!561 = distinct !DILexicalBlock(scope: !538, file: !3, line: 120, column: 6)
!562 = !DILocation(line: 120, column: 24, scope: !561, inlinedAt: !548)
!563 = !DILocation(line: 120, column: 6, scope: !538, inlinedAt: !548)
!564 = !DILocation(line: 124, column: 9, scope: !538, inlinedAt: !548)
!565 = !DILocation(line: 126, column: 14, scope: !538, inlinedAt: !548)
!566 = !{!567, !414, i64 9}
!567 = !{!"iphdr", !414, i64 0, !414, i64 0, !414, i64 1, !442, i64 2, !442, i64 4, !442, i64 6, !414, i64 8, !414, i64 9, !442, i64 10, !414, i64 12}
!568 = !DILocation(line: 126, column: 9, scope: !538, inlinedAt: !548)
!569 = !DILocation(line: 126, column: 2, scope: !538, inlinedAt: !548)
!570 = !DILocation(line: 309, column: 6, scope: !571)
!571 = distinct !DILexicalBlock(scope: !549, file: !3, line: 309, column: 6)
!572 = !DILocation(line: 309, column: 10, scope: !571)
!573 = !DILocation(line: 325, column: 3, scope: !549)
!574 = !DILocation(line: 0, scope: !473, inlinedAt: !575)
!575 = distinct !DILocation(line: 329, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !549, file: !3, line: 326, column: 9)
!577 = !DILocation(line: 171, column: 8, scope: !486, inlinedAt: !575)
!578 = !DILocation(line: 171, column: 12, scope: !486, inlinedAt: !575)
!579 = !DILocation(line: 171, column: 6, scope: !473, inlinedAt: !575)
!580 = !DILocation(line: 174, column: 11, scope: !473, inlinedAt: !575)
!581 = !DILocation(line: 174, column: 16, scope: !473, inlinedAt: !575)
!582 = !DILocation(line: 176, column: 9, scope: !492, inlinedAt: !575)
!583 = !DILocation(line: 176, column: 5, scope: !473, inlinedAt: !575)
!584 = !DILocation(line: 180, column: 14, scope: !495, inlinedAt: !575)
!585 = !DILocation(line: 180, column: 20, scope: !495, inlinedAt: !575)
!586 = !DILocation(line: 180, column: 6, scope: !473, inlinedAt: !575)
!587 = !DILocation(line: 188, column: 10, scope: !473, inlinedAt: !575)
!588 = !DILocation(line: 190, column: 2, scope: !473, inlinedAt: !575)
!589 = !DILocation(line: 0, scope: !501, inlinedAt: !590)
!590 = distinct !DILocation(line: 335, column: 17, scope: !576)
!591 = !DILocation(line: 151, column: 8, scope: !513, inlinedAt: !590)
!592 = !DILocation(line: 151, column: 14, scope: !513, inlinedAt: !590)
!593 = !DILocation(line: 151, column: 12, scope: !513, inlinedAt: !590)
!594 = !DILocation(line: 151, column: 6, scope: !501, inlinedAt: !590)
!595 = !DILocation(line: 149, column: 25, scope: !501, inlinedAt: !590)
!596 = !DILocation(line: 158, column: 6, scope: !501, inlinedAt: !590)
!597 = !DILocalVariable(name: "nh", arg: 1, scope: !598, file: !3, line: 129, type: !426)
!598 = distinct !DISubprogram(name: "parse_icmphdr", scope: !3, file: !3, line: 129, type: !599, scopeLine: 132, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !602)
!599 = !DISubroutineType(types: !600)
!600 = !{!59, !426, !46, !601}
!601 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!602 = !{!597, !603, !604, !605}
!603 = !DILocalVariable(name: "data_end", arg: 2, scope: !598, file: !3, line: 130, type: !46)
!604 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !598, file: !3, line: 131, type: !601)
!605 = !DILocalVariable(name: "icmph", scope: !598, file: !3, line: 133, type: !212)
!606 = !DILocation(line: 0, scope: !598, inlinedAt: !607)
!607 = distinct !DILocation(line: 344, column: 17, scope: !576)
!608 = !DILocation(line: 135, column: 12, scope: !609, inlinedAt: !607)
!609 = distinct !DILexicalBlock(scope: !598, file: !3, line: 135, column: 6)
!610 = !DILocation(line: 135, column: 18, scope: !609, inlinedAt: !607)
!611 = !DILocation(line: 135, column: 16, scope: !609, inlinedAt: !607)
!612 = !DILocation(line: 135, column: 6, scope: !598, inlinedAt: !607)
!613 = !DILocation(line: 133, column: 30, scope: !598, inlinedAt: !607)
!614 = !DILocation(line: 141, column: 2, scope: !598, inlinedAt: !607)
!615 = !DILocation(line: 241, column: 18, scope: !56)
!616 = !DILocation(line: 242, column: 16, scope: !56)
!617 = !DILocation(line: 243, column: 19, scope: !56)
!618 = !DILocation(line: 244, column: 18, scope: !56)
!619 = !DILocation(line: 245, column: 17, scope: !56)
!620 = !DILocation(line: 246, column: 17, scope: !56)
!621 = !DILocation(line: 0, scope: !267)
!622 = !DILocation(line: 353, column: 2, scope: !267)
!623 = !DILocation(line: 355, column: 3, scope: !269)
!624 = !DILocation(line: 0, scope: !269)
!625 = !DILocation(line: 355, column: 9, scope: !269)
!626 = !{!413, !413, i64 0}
!627 = !DILocation(line: 356, column: 27, scope: !269)
!628 = !DILocation(line: 361, column: 14, scope: !629)
!629 = distinct !DILexicalBlock(scope: !269, file: !3, line: 361, column: 13)
!630 = !DILocation(line: 361, column: 21, scope: !629)
!631 = !DILocation(line: 361, column: 32, scope: !629)
!632 = !DILocation(line: 371, column: 22, scope: !633)
!633 = distinct !DILexicalBlock(scope: !269, file: !3, line: 371, column: 13)
!634 = !DILocation(line: 371, column: 14, scope: !633)
!635 = !DILocation(line: 371, column: 13, scope: !269)
!636 = !DILocation(line: 377, column: 13, scope: !269)
!637 = !DILocation(line: 380, column: 25, scope: !638)
!638 = distinct !DILexicalBlock(scope: !639, file: !3, line: 380, column: 17)
!639 = distinct !DILexicalBlock(scope: !640, file: !3, line: 378, column: 9)
!640 = distinct !DILexicalBlock(scope: !269, file: !3, line: 377, column: 13)
!641 = !DILocation(line: 380, column: 17, scope: !638)
!642 = !DILocation(line: 380, column: 34, scope: !638)
!643 = !DILocation(line: 380, column: 39, scope: !638)
!644 = !DILocation(line: 380, column: 43, scope: !638)
!645 = !{!414, !414, i64 0}
!646 = !DILocation(line: 380, column: 74, scope: !638)
!647 = !DILocation(line: 380, column: 95, scope: !638)
!648 = !DILocation(line: 380, column: 98, scope: !638)
!649 = !DILocation(line: 380, column: 132, scope: !638)
!650 = !DILocation(line: 380, column: 129, scope: !638)
!651 = !DILocation(line: 380, column: 150, scope: !638)
!652 = !DILocation(line: 380, column: 153, scope: !638)
!653 = !DILocation(line: 380, column: 187, scope: !638)
!654 = !DILocation(line: 380, column: 184, scope: !638)
!655 = !DILocation(line: 380, column: 205, scope: !638)
!656 = !DILocation(line: 380, column: 208, scope: !638)
!657 = !DILocation(line: 380, column: 242, scope: !638)
!658 = !DILocation(line: 380, column: 239, scope: !638)
!659 = !DILocation(line: 380, column: 17, scope: !639)
!660 = !DILocation(line: 386, column: 25, scope: !661)
!661 = distinct !DILexicalBlock(scope: !639, file: !3, line: 386, column: 17)
!662 = !DILocation(line: 386, column: 17, scope: !661)
!663 = !DILocation(line: 386, column: 35, scope: !661)
!664 = !DILocation(line: 386, column: 40, scope: !661)
!665 = !DILocation(line: 386, column: 44, scope: !661)
!666 = !DILocation(line: 386, column: 75, scope: !661)
!667 = !DILocation(line: 386, column: 96, scope: !661)
!668 = !DILocation(line: 386, column: 99, scope: !661)
!669 = !DILocation(line: 386, column: 133, scope: !661)
!670 = !DILocation(line: 386, column: 130, scope: !661)
!671 = !DILocation(line: 386, column: 151, scope: !661)
!672 = !DILocation(line: 386, column: 154, scope: !661)
!673 = !DILocation(line: 386, column: 188, scope: !661)
!674 = !DILocation(line: 386, column: 185, scope: !661)
!675 = !DILocation(line: 386, column: 206, scope: !661)
!676 = !DILocation(line: 386, column: 209, scope: !661)
!677 = !DILocation(line: 386, column: 243, scope: !661)
!678 = !DILocation(line: 386, column: 240, scope: !661)
!679 = !DILocation(line: 386, column: 17, scope: !639)
!680 = !DILocation(line: 392, column: 25, scope: !681)
!681 = distinct !DILexicalBlock(scope: !639, file: !3, line: 392, column: 17)
!682 = !{!683, !413, i64 8}
!683 = !{!"filter", !413, i64 0, !413, i64 4, !414, i64 5, !413, i64 6, !413, i64 8, !413, i64 12, !414, i64 16, !414, i64 32, !413, i64 48, !414, i64 49, !413, i64 50, !414, i64 51, !413, i64 52, !442, i64 54, !413, i64 56, !442, i64 58, !413, i64 60, !414, i64 61, !684, i64 64, !685, i64 76, !686, i64 84}
!684 = !{!"tcpopts", !413, i64 0, !413, i64 0, !442, i64 2, !413, i64 4, !442, i64 6, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 8, !413, i64 9, !413, i64 9, !413, i64 9, !413, i64 9, !413, i64 9, !413, i64 9, !413, i64 9, !413, i64 9}
!685 = !{!"udpopts", !413, i64 0, !413, i64 0, !442, i64 2, !413, i64 4, !442, i64 6}
!686 = !{!"icmpopts", !413, i64 0, !413, i64 0, !414, i64 1, !413, i64 2, !414, i64 3}
!687 = !DILocation(line: 392, column: 31, scope: !681)
!688 = !DILocation(line: 392, column: 36, scope: !681)
!689 = !DILocation(line: 392, column: 47, scope: !681)
!690 = !{!683, !413, i64 12}
!691 = !DILocation(line: 392, column: 53, scope: !681)
!692 = !DILocation(line: 392, column: 17, scope: !639)
!693 = !DILocation(line: 399, column: 25, scope: !694)
!694 = distinct !DILexicalBlock(scope: !639, file: !3, line: 399, column: 17)
!695 = !DILocation(line: 399, column: 17, scope: !694)
!696 = !DILocation(line: 399, column: 36, scope: !694)
!697 = !DILocation(line: 399, column: 47, scope: !694)
!698 = !{!683, !414, i64 51}
!699 = !DILocation(line: 399, column: 63, scope: !694)
!700 = !{!465, !414, i64 7}
!701 = !DILocation(line: 399, column: 55, scope: !694)
!702 = !DILocation(line: 399, column: 17, scope: !639)
!703 = !DILocation(line: 405, column: 25, scope: !704)
!704 = distinct !DILexicalBlock(scope: !639, file: !3, line: 405, column: 17)
!705 = !DILocation(line: 405, column: 17, scope: !704)
!706 = !DILocation(line: 405, column: 36, scope: !704)
!707 = !DILocation(line: 405, column: 47, scope: !704)
!708 = !{!683, !414, i64 49}
!709 = !DILocation(line: 405, column: 63, scope: !704)
!710 = !DILocation(line: 405, column: 55, scope: !704)
!711 = !DILocation(line: 405, column: 17, scope: !639)
!712 = !DILocation(line: 411, column: 25, scope: !713)
!713 = distinct !DILexicalBlock(scope: !639, file: !3, line: 411, column: 17)
!714 = !DILocation(line: 411, column: 17, scope: !713)
!715 = !DILocation(line: 411, column: 36, scope: !713)
!716 = !DILocation(line: 411, column: 47, scope: !713)
!717 = !{!683, !442, i64 58}
!718 = !DILocation(line: 411, column: 39, scope: !713)
!719 = !DILocation(line: 411, column: 58, scope: !713)
!720 = !{!465, !442, i64 4}
!721 = !DILocation(line: 411, column: 83, scope: !713)
!722 = !DILocation(line: 411, column: 55, scope: !713)
!723 = !DILocation(line: 411, column: 17, scope: !639)
!724 = !DILocation(line: 417, column: 25, scope: !725)
!725 = distinct !DILexicalBlock(scope: !639, file: !3, line: 417, column: 17)
!726 = !DILocation(line: 417, column: 17, scope: !725)
!727 = !DILocation(line: 417, column: 36, scope: !725)
!728 = !DILocation(line: 417, column: 47, scope: !725)
!729 = !{!683, !442, i64 54}
!730 = !DILocation(line: 417, column: 39, scope: !725)
!731 = !DILocation(line: 417, column: 58, scope: !725)
!732 = !DILocation(line: 417, column: 83, scope: !725)
!733 = !DILocation(line: 417, column: 55, scope: !725)
!734 = !DILocation(line: 417, column: 17, scope: !639)
!735 = !DILocation(line: 422, column: 18, scope: !640)
!736 = !DILocation(line: 428, column: 25, scope: !737)
!737 = distinct !DILexicalBlock(scope: !738, file: !3, line: 428, column: 17)
!738 = distinct !DILexicalBlock(scope: !739, file: !3, line: 423, column: 9)
!739 = distinct !DILexicalBlock(scope: !640, file: !3, line: 422, column: 18)
!740 = !DILocation(line: 428, column: 30, scope: !737)
!741 = !DILocation(line: 428, column: 34, scope: !737)
!742 = !DILocation(line: 428, column: 42, scope: !737)
!743 = !DILocation(line: 428, column: 48, scope: !737)
!744 = !DILocation(line: 428, column: 17, scope: !738)
!745 = !DILocation(line: 435, column: 25, scope: !746)
!746 = distinct !DILexicalBlock(scope: !738, file: !3, line: 435, column: 17)
!747 = !DILocation(line: 435, column: 31, scope: !746)
!748 = !DILocation(line: 435, column: 36, scope: !746)
!749 = !DILocation(line: 435, column: 44, scope: !746)
!750 = !DILocation(line: 435, column: 50, scope: !746)
!751 = !DILocation(line: 435, column: 17, scope: !738)
!752 = !DILocation(line: 437, column: 17, scope: !753)
!753 = distinct !DILexicalBlock(scope: !754, file: !3, line: 437, column: 17)
!754 = distinct !DILexicalBlock(scope: !746, file: !3, line: 436, column: 13)
!755 = !DILocation(line: 438, column: 17, scope: !754)
!756 = !DILocation(line: 442, column: 26, scope: !757)
!757 = distinct !DILexicalBlock(scope: !738, file: !3, line: 442, column: 17)
!758 = !DILocation(line: 442, column: 18, scope: !757)
!759 = !DILocation(line: 442, column: 36, scope: !757)
!760 = !DILocation(line: 442, column: 41, scope: !757)
!761 = !DILocation(line: 442, column: 44, scope: !757)
!762 = !DILocation(line: 442, column: 62, scope: !757)
!763 = !DILocation(line: 442, column: 67, scope: !757)
!764 = !DILocation(line: 442, column: 70, scope: !757)
!765 = !DILocation(line: 442, column: 88, scope: !757)
!766 = !DILocation(line: 442, column: 93, scope: !757)
!767 = !DILocation(line: 442, column: 96, scope: !757)
!768 = !DILocation(line: 442, column: 114, scope: !757)
!769 = !DILocation(line: 442, column: 120, scope: !757)
!770 = !DILocation(line: 442, column: 132, scope: !757)
!771 = !DILocation(line: 442, column: 124, scope: !757)
!772 = !DILocation(line: 442, column: 142, scope: !757)
!773 = !DILocation(line: 442, column: 147, scope: !757)
!774 = !DILocation(line: 442, column: 150, scope: !757)
!775 = !DILocation(line: 442, column: 168, scope: !757)
!776 = !DILocation(line: 442, column: 173, scope: !757)
!777 = !DILocation(line: 442, column: 176, scope: !757)
!778 = !DILocation(line: 442, column: 194, scope: !757)
!779 = !DILocation(line: 442, column: 199, scope: !757)
!780 = !DILocation(line: 442, column: 202, scope: !757)
!781 = !DILocation(line: 442, column: 220, scope: !757)
!782 = !DILocation(line: 442, column: 17, scope: !738)
!783 = !DILocation(line: 450, column: 25, scope: !784)
!784 = distinct !DILexicalBlock(scope: !738, file: !3, line: 450, column: 17)
!785 = !DILocation(line: 450, column: 17, scope: !784)
!786 = !DILocation(line: 450, column: 32, scope: !784)
!787 = !DILocation(line: 450, column: 43, scope: !784)
!788 = !{!683, !414, i64 61}
!789 = !DILocation(line: 450, column: 35, scope: !784)
!790 = !DILocation(line: 450, column: 55, scope: !784)
!791 = !{!567, !414, i64 1}
!792 = !DILocation(line: 450, column: 50, scope: !784)
!793 = !DILocation(line: 450, column: 47, scope: !784)
!794 = !DILocation(line: 450, column: 17, scope: !738)
!795 = !DILocation(line: 457, column: 25, scope: !796)
!796 = distinct !DILexicalBlock(scope: !738, file: !3, line: 457, column: 17)
!797 = !DILocation(line: 457, column: 17, scope: !796)
!798 = !DILocation(line: 457, column: 36, scope: !796)
!799 = !DILocation(line: 457, column: 47, scope: !796)
!800 = !DILocation(line: 457, column: 62, scope: !796)
!801 = !{!567, !414, i64 8}
!802 = !DILocation(line: 457, column: 55, scope: !796)
!803 = !DILocation(line: 457, column: 17, scope: !738)
!804 = !DILocation(line: 464, column: 25, scope: !805)
!805 = distinct !DILexicalBlock(scope: !738, file: !3, line: 464, column: 17)
!806 = !DILocation(line: 464, column: 17, scope: !805)
!807 = !DILocation(line: 464, column: 36, scope: !805)
!808 = !DILocation(line: 464, column: 47, scope: !805)
!809 = !DILocation(line: 464, column: 62, scope: !805)
!810 = !DILocation(line: 464, column: 55, scope: !805)
!811 = !DILocation(line: 464, column: 17, scope: !738)
!812 = !DILocation(line: 471, column: 25, scope: !813)
!813 = distinct !DILexicalBlock(scope: !738, file: !3, line: 471, column: 17)
!814 = !DILocation(line: 471, column: 17, scope: !813)
!815 = !DILocation(line: 471, column: 36, scope: !813)
!816 = !DILocation(line: 471, column: 47, scope: !813)
!817 = !DILocation(line: 471, column: 39, scope: !813)
!818 = !DILocation(line: 471, column: 58, scope: !813)
!819 = !{!567, !442, i64 2}
!820 = !DILocation(line: 471, column: 78, scope: !813)
!821 = !DILocation(line: 471, column: 55, scope: !813)
!822 = !DILocation(line: 471, column: 17, scope: !738)
!823 = !DILocation(line: 478, column: 25, scope: !824)
!824 = distinct !DILexicalBlock(scope: !738, file: !3, line: 478, column: 17)
!825 = !DILocation(line: 478, column: 17, scope: !824)
!826 = !DILocation(line: 478, column: 36, scope: !824)
!827 = !DILocation(line: 478, column: 47, scope: !824)
!828 = !DILocation(line: 478, column: 39, scope: !824)
!829 = !DILocation(line: 478, column: 58, scope: !824)
!830 = !DILocation(line: 478, column: 78, scope: !824)
!831 = !DILocation(line: 478, column: 55, scope: !824)
!832 = !DILocation(line: 478, column: 17, scope: !738)
!833 = !DILocation(line: 486, column: 15, scope: !834)
!834 = distinct !DILexicalBlock(scope: !269, file: !3, line: 486, column: 7)
!835 = !DILocation(line: 486, column: 23, scope: !834)
!836 = !DILocation(line: 486, column: 7, scope: !834)
!837 = !DILocation(line: 486, column: 7, scope: !269)
!838 = !DILocation(line: 489, column: 17, scope: !839)
!839 = distinct !DILexicalBlock(scope: !834, file: !3, line: 487, column: 9)
!840 = !DILocation(line: 495, column: 17, scope: !841)
!841 = distinct !DILexicalBlock(scope: !839, file: !3, line: 495, column: 17)
!842 = !DILocation(line: 495, column: 42, scope: !841)
!843 = !DILocation(line: 495, column: 45, scope: !841)
!844 = !{!683, !442, i64 66}
!845 = !DILocation(line: 495, column: 83, scope: !841)
!846 = !{!847, !442, i64 0}
!847 = !{!"tcphdr", !442, i64 0, !442, i64 2, !413, i64 4, !413, i64 8, !442, i64 12, !442, i64 12, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 13, !442, i64 14, !442, i64 16, !442, i64 18}
!848 = !DILocation(line: 495, column: 74, scope: !841)
!849 = !DILocation(line: 495, column: 17, scope: !839)
!850 = !DILocation(line: 501, column: 33, scope: !851)
!851 = distinct !DILexicalBlock(scope: !839, file: !3, line: 501, column: 17)
!852 = !DILocation(line: 501, column: 17, scope: !851)
!853 = !DILocation(line: 501, column: 42, scope: !851)
!854 = !DILocation(line: 501, column: 45, scope: !851)
!855 = !{!683, !442, i64 70}
!856 = !DILocation(line: 501, column: 83, scope: !851)
!857 = !{!847, !442, i64 2}
!858 = !DILocation(line: 501, column: 74, scope: !851)
!859 = !DILocation(line: 501, column: 17, scope: !839)
!860 = !DILocation(line: 507, column: 33, scope: !861)
!861 = distinct !DILexicalBlock(scope: !839, file: !3, line: 507, column: 17)
!862 = !DILocation(line: 507, column: 17, scope: !861)
!863 = !DILocation(line: 507, column: 40, scope: !861)
!864 = !DILocation(line: 507, column: 59, scope: !861)
!865 = !DILocation(line: 507, column: 72, scope: !861)
!866 = !DILocation(line: 507, column: 63, scope: !861)
!867 = !DILocation(line: 507, column: 17, scope: !839)
!868 = !DILocation(line: 513, column: 17, scope: !869)
!869 = distinct !DILexicalBlock(scope: !839, file: !3, line: 513, column: 17)
!870 = !DILocation(line: 513, column: 40, scope: !869)
!871 = !DILocation(line: 513, column: 59, scope: !869)
!872 = !DILocation(line: 513, column: 72, scope: !869)
!873 = !DILocation(line: 513, column: 63, scope: !869)
!874 = !DILocation(line: 513, column: 17, scope: !839)
!875 = !DILocation(line: 519, column: 17, scope: !876)
!876 = distinct !DILexicalBlock(scope: !839, file: !3, line: 519, column: 17)
!877 = !DILocation(line: 519, column: 40, scope: !876)
!878 = !DILocation(line: 519, column: 59, scope: !876)
!879 = !DILocation(line: 519, column: 72, scope: !876)
!880 = !DILocation(line: 519, column: 63, scope: !876)
!881 = !DILocation(line: 519, column: 17, scope: !839)
!882 = !DILocation(line: 525, column: 17, scope: !883)
!883 = distinct !DILexicalBlock(scope: !839, file: !3, line: 525, column: 17)
!884 = !DILocation(line: 525, column: 40, scope: !883)
!885 = !DILocation(line: 525, column: 59, scope: !883)
!886 = !DILocation(line: 525, column: 72, scope: !883)
!887 = !DILocation(line: 525, column: 63, scope: !883)
!888 = !DILocation(line: 525, column: 17, scope: !839)
!889 = !DILocation(line: 531, column: 17, scope: !890)
!890 = distinct !DILexicalBlock(scope: !839, file: !3, line: 531, column: 17)
!891 = !DILocation(line: 531, column: 40, scope: !890)
!892 = !DILocation(line: 531, column: 72, scope: !890)
!893 = !DILocation(line: 531, column: 63, scope: !890)
!894 = !DILocation(line: 531, column: 17, scope: !839)
!895 = !DILocation(line: 537, column: 17, scope: !896)
!896 = distinct !DILexicalBlock(scope: !839, file: !3, line: 537, column: 17)
!897 = !DILocation(line: 537, column: 40, scope: !896)
!898 = !DILocation(line: 537, column: 59, scope: !896)
!899 = !DILocation(line: 537, column: 72, scope: !896)
!900 = !DILocation(line: 537, column: 63, scope: !896)
!901 = !DILocation(line: 537, column: 17, scope: !839)
!902 = !DILocation(line: 543, column: 17, scope: !903)
!903 = distinct !DILexicalBlock(scope: !839, file: !3, line: 543, column: 17)
!904 = !DILocation(line: 543, column: 40, scope: !903)
!905 = !DILocation(line: 543, column: 59, scope: !903)
!906 = !DILocation(line: 543, column: 72, scope: !903)
!907 = !DILocation(line: 543, column: 63, scope: !903)
!908 = !DILocation(line: 543, column: 17, scope: !839)
!909 = !DILocation(line: 549, column: 17, scope: !910)
!910 = distinct !DILexicalBlock(scope: !839, file: !3, line: 549, column: 17)
!911 = !DILocation(line: 549, column: 40, scope: !910)
!912 = !DILocation(line: 549, column: 72, scope: !910)
!913 = !DILocation(line: 549, column: 63, scope: !910)
!914 = !DILocation(line: 549, column: 17, scope: !839)
!915 = !DILocation(line: 554, column: 26, scope: !916)
!916 = distinct !DILexicalBlock(scope: !834, file: !3, line: 554, column: 18)
!917 = !DILocation(line: 554, column: 34, scope: !916)
!918 = !DILocation(line: 554, column: 18, scope: !916)
!919 = !DILocation(line: 554, column: 18, scope: !834)
!920 = !DILocation(line: 556, column: 17, scope: !921)
!921 = distinct !DILexicalBlock(scope: !916, file: !3, line: 555, column: 9)
!922 = !DILocation(line: 562, column: 17, scope: !923)
!923 = distinct !DILexicalBlock(scope: !921, file: !3, line: 562, column: 17)
!924 = !DILocation(line: 562, column: 42, scope: !923)
!925 = !DILocation(line: 562, column: 45, scope: !923)
!926 = !{!683, !442, i64 78}
!927 = !DILocation(line: 562, column: 83, scope: !923)
!928 = !{!929, !442, i64 0}
!929 = !{!"udphdr", !442, i64 0, !442, i64 2, !442, i64 4, !442, i64 6}
!930 = !DILocation(line: 562, column: 74, scope: !923)
!931 = !DILocation(line: 562, column: 17, scope: !921)
!932 = !DILocation(line: 568, column: 33, scope: !933)
!933 = distinct !DILexicalBlock(scope: !921, file: !3, line: 568, column: 17)
!934 = !DILocation(line: 568, column: 17, scope: !933)
!935 = !DILocation(line: 568, column: 42, scope: !933)
!936 = !DILocation(line: 568, column: 45, scope: !933)
!937 = !{!683, !442, i64 82}
!938 = !DILocation(line: 568, column: 83, scope: !933)
!939 = !{!929, !442, i64 2}
!940 = !DILocation(line: 568, column: 74, scope: !933)
!941 = !DILocation(line: 568, column: 17, scope: !921)
!942 = !DILocation(line: 573, column: 27, scope: !943)
!943 = distinct !DILexicalBlock(scope: !916, file: !3, line: 573, column: 19)
!944 = !DILocation(line: 573, column: 36, scope: !943)
!945 = !DILocation(line: 573, column: 19, scope: !943)
!946 = !DILocation(line: 573, column: 19, scope: !916)
!947 = !DILocation(line: 575, column: 17, scope: !948)
!948 = distinct !DILexicalBlock(scope: !943, file: !3, line: 573, column: 44)
!949 = !DILocation(line: 577, column: 17, scope: !950)
!950 = distinct !DILexicalBlock(scope: !951, file: !3, line: 577, column: 17)
!951 = distinct !DILexicalBlock(scope: !952, file: !3, line: 576, column: 13)
!952 = distinct !DILexicalBlock(scope: !948, file: !3, line: 575, column: 17)
!953 = !DILocation(line: 579, column: 38, scope: !954)
!954 = distinct !DILexicalBlock(scope: !951, file: !3, line: 579, column: 21)
!955 = !DILocation(line: 579, column: 21, scope: !954)
!956 = !DILocation(line: 579, column: 46, scope: !954)
!957 = !DILocation(line: 579, column: 66, scope: !954)
!958 = !{!683, !414, i64 85}
!959 = !DILocation(line: 579, column: 81, scope: !954)
!960 = !{!961, !414, i64 1}
!961 = !{!"icmphdr", !414, i64 0, !414, i64 1, !442, i64 2, !414, i64 4}
!962 = !DILocation(line: 579, column: 71, scope: !954)
!963 = !DILocation(line: 579, column: 21, scope: !951)
!964 = !DILocation(line: 585, column: 38, scope: !965)
!965 = distinct !DILexicalBlock(scope: !951, file: !3, line: 585, column: 21)
!966 = !DILocation(line: 585, column: 21, scope: !965)
!967 = !DILocation(line: 585, column: 46, scope: !965)
!968 = !DILocation(line: 585, column: 66, scope: !965)
!969 = !{!683, !414, i64 87}
!970 = !DILocation(line: 585, column: 81, scope: !965)
!971 = !{!961, !414, i64 0}
!972 = !DILocation(line: 585, column: 71, scope: !965)
!973 = !DILocation(line: 585, column: 21, scope: !951)
!974 = !DILocation(line: 590, column: 22, scope: !952)
!975 = !DILocation(line: 593, column: 21, scope: !976)
!976 = distinct !DILexicalBlock(scope: !977, file: !3, line: 593, column: 21)
!977 = distinct !DILexicalBlock(scope: !978, file: !3, line: 591, column: 13)
!978 = distinct !DILexicalBlock(scope: !952, file: !3, line: 590, column: 22)
!979 = !DILocation(line: 593, column: 46, scope: !976)
!980 = !DILocation(line: 593, column: 66, scope: !976)
!981 = !DILocation(line: 593, column: 82, scope: !976)
!982 = !{!983, !414, i64 1}
!983 = !{!"icmp6hdr", !414, i64 0, !414, i64 1, !442, i64 2, !414, i64 4}
!984 = !DILocation(line: 593, column: 71, scope: !976)
!985 = !DILocation(line: 593, column: 21, scope: !977)
!986 = !DILocation(line: 599, column: 38, scope: !987)
!987 = distinct !DILexicalBlock(scope: !977, file: !3, line: 599, column: 21)
!988 = !DILocation(line: 599, column: 21, scope: !987)
!989 = !DILocation(line: 599, column: 46, scope: !987)
!990 = !DILocation(line: 599, column: 66, scope: !987)
!991 = !DILocation(line: 599, column: 82, scope: !987)
!992 = !{!983, !414, i64 0}
!993 = !DILocation(line: 599, column: 71, scope: !987)
!994 = !DILocation(line: 599, column: 21, scope: !977)
!995 = !DILocation(line: 611, column: 9, scope: !996)
!996 = distinct !DILexicalBlock(scope: !269, file: !3, line: 611, column: 9)
!997 = !{!683, !413, i64 0}
!998 = !{!683, !414, i64 5}
!999 = !DILocation(line: 613, column: 26, scope: !269)
!1000 = !DILocation(line: 613, column: 18, scope: !269)
!1001 = !DILocation(line: 616, column: 2, scope: !270)
!1002 = !DILocation(line: 353, column: 37, scope: !270)
!1003 = !DILocation(line: 353, column: 21, scope: !270)
!1004 = distinct !{!1004, !622, !1005, !1006}
!1005 = !DILocation(line: 616, column: 2, scope: !267)
!1006 = !{!"llvm.loop.mustprogress"}
!1007 = !DILocation(line: 620, column: 13, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !56, file: !3, line: 620, column: 8)
!1009 = !DILocation(line: 620, column: 8, scope: !56)
!1010 = !DILocation(line: 0, scope: !1011, inlinedAt: !1021)
!1011 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !3, file: !3, line: 194, type: !1012, scopeLine: 195, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1014)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!64, !60, !64}
!1014 = !{!1015, !1016, !1017, !1018, !1019, !1020}
!1015 = !DILocalVariable(name: "ctx", arg: 1, scope: !1011, file: !3, line: 194, type: !60)
!1016 = !DILocalVariable(name: "action", arg: 2, scope: !1011, file: !3, line: 194, type: !64)
!1017 = !DILocalVariable(name: "data_end", scope: !1011, file: !3, line: 196, type: !46)
!1018 = !DILocalVariable(name: "data", scope: !1011, file: !3, line: 197, type: !46)
!1019 = !DILocalVariable(name: "rec", scope: !1011, file: !3, line: 203, type: !366)
!1020 = !DILocalVariable(name: "bytes", scope: !1011, file: !3, line: 208, type: !370)
!1021 = distinct !DILocation(line: 622, column: 16, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 620, column: 18)
!1023 = !DILocation(line: 196, column: 38, scope: !1011, inlinedAt: !1021)
!1024 = !DILocation(line: 196, column: 27, scope: !1011, inlinedAt: !1021)
!1025 = !DILocation(line: 197, column: 38, scope: !1011, inlinedAt: !1021)
!1026 = !DILocation(line: 197, column: 27, scope: !1011, inlinedAt: !1021)
!1027 = !DILocation(line: 199, column: 13, scope: !1028, inlinedAt: !1021)
!1028 = distinct !DILexicalBlock(scope: !1011, file: !3, line: 199, column: 6)
!1029 = !DILocation(line: 199, column: 6, scope: !1011, inlinedAt: !1021)
!1030 = !DILocation(line: 203, column: 24, scope: !1011, inlinedAt: !1021)
!1031 = !DILocation(line: 204, column: 7, scope: !1032, inlinedAt: !1021)
!1032 = distinct !DILexicalBlock(scope: !1011, file: !3, line: 204, column: 6)
!1033 = !DILocation(line: 204, column: 6, scope: !1011, inlinedAt: !1021)
!1034 = !DILocation(line: 208, column: 25, scope: !1011, inlinedAt: !1021)
!1035 = !DILocation(line: 214, column: 7, scope: !1011, inlinedAt: !1021)
!1036 = !DILocation(line: 214, column: 17, scope: !1011, inlinedAt: !1021)
!1037 = !{!1038, !1039, i64 0}
!1038 = !{!"datarec", !1039, i64 0, !1039, i64 8}
!1039 = !{!"long long", !414, i64 0}
!1040 = !DILocation(line: 215, column: 7, scope: !1011, inlinedAt: !1021)
!1041 = !DILocation(line: 215, column: 16, scope: !1011, inlinedAt: !1021)
!1042 = !{!1038, !1039, i64 8}
!1043 = !DILocation(line: 217, column: 9, scope: !1011, inlinedAt: !1021)
!1044 = !DILocation(line: 218, column: 1, scope: !1011, inlinedAt: !1021)
!1045 = !DILocation(line: 622, column: 9, scope: !1022)
!1046 = !DILocation(line: 0, scope: !1011, inlinedAt: !1047)
!1047 = distinct !DILocation(line: 626, column: 12, scope: !56)
!1048 = !DILocation(line: 196, column: 38, scope: !1011, inlinedAt: !1047)
!1049 = !DILocation(line: 197, column: 38, scope: !1011, inlinedAt: !1047)
!1050 = !DILocation(line: 203, column: 24, scope: !1011, inlinedAt: !1047)
!1051 = !DILocation(line: 204, column: 7, scope: !1032, inlinedAt: !1047)
!1052 = !DILocation(line: 204, column: 6, scope: !1011, inlinedAt: !1047)
!1053 = !DILocation(line: 197, column: 27, scope: !1011, inlinedAt: !1047)
!1054 = !DILocation(line: 196, column: 27, scope: !1011, inlinedAt: !1047)
!1055 = !DILocation(line: 208, column: 25, scope: !1011, inlinedAt: !1047)
!1056 = !DILocation(line: 214, column: 7, scope: !1011, inlinedAt: !1047)
!1057 = !DILocation(line: 214, column: 17, scope: !1011, inlinedAt: !1047)
!1058 = !DILocation(line: 215, column: 7, scope: !1011, inlinedAt: !1047)
!1059 = !DILocation(line: 215, column: 16, scope: !1011, inlinedAt: !1047)
!1060 = !DILocation(line: 217, column: 9, scope: !1011, inlinedAt: !1047)
!1061 = !DILocation(line: 218, column: 1, scope: !1011, inlinedAt: !1047)
!1062 = !DILocation(line: 626, column: 5, scope: !56)
!1063 = !DILocation(line: 628, column: 1, scope: !56)
