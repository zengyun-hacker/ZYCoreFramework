//
//  ZYCoreQRViewController.m
//  Pods
//
//  Created by Xiao Du on 15/5/17.
//
//

#import "ZYCoreQRViewController.h"
#import "ZYCoreDefine.h"

static const char *kScanQRCodeQueueName = "ZYCoreScanQRCodeQueue";

@interface ZYCoreQRViewController ()

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

@implementation ZYCoreQRViewController

- (void)setObjectTypes:(NSArray *)types {
    if (self.captureMetadataOutput) {
        [self.captureMetadataOutput setMetadataObjectTypes:types];
    }
}

- (void)setOutputInterest:(CGRect)rect {
    if (self.captureMetadataOutput) {
        self.captureMetadataOutput.rectOfInterest = rect;
    }
}

- (void)viewDidLoad {
	[super viewDidLoad];
    [self addReadingView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self startReading];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addReadingView {
    // 获取 AVCaptureDevice 实例
    self.shouldRead = YES;
    NSError *error;
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 初始化输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    // 创建会话
    _captureSession = [[AVCaptureSession alloc] init];
    // 添加输入流
    [_captureSession addInput:input];
    // 初始化输出流
    self.captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    // 添加输出流
    [_captureSession addOutput:self.captureMetadataOutput];
    
    // 创建dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create(kScanQRCodeQueueName, NULL);
    [self.captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    // 设置元数据类型 AVMetadataObjectTypeQRCode
    [self.captureMetadataOutput setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code]];
    
    // 创建输出对象
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:self.view.layer.bounds];
    [self.view.layer addSublayer:_videoPreviewLayer];
}

- (BOOL)startReading {
	// 开始会话
	[_captureSession startRunning];
	
	return YES;
}

- (void)stopReading {
	// 停止会话
	[_captureSession stopRunning];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection {
	if (metadataObjects != nil && [metadataObjects count] > 0) {
		AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
		NSString *result;
        result = metadataObj.stringValue;
        if (result) {
            [self performSelectorOnMainThread:@selector(reportScanResult:) withObject:result waitUntilDone:NO];
        }
	}
}

- (void)reportScanResult:(NSString *)result {
	[self stopReading];
	
	if (!self.shouldRead) {
		return;
	}
	[self scanFinish:result];
}

- (void)scanFinish:(NSString *)result {
}

@end
