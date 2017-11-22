//
//  AddTaskViewController.m
//  Every.DoItAgain
//
//  Created by Larry Luk on 2017-11-22.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTxtField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTxtField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTxtField;
@property (strong, nonatomic) NSUserDefaults *defaults;


@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self.defaults setValue:@"Todo" forKey:@"TodoTitle"];
    [self.defaults setValue:@"Todo some stuff" forKey:@"TodoDesc"];
    [self.defaults setInteger:1 forKey:@"Priority"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)quitPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addPressed:(id)sender {
    
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;

    
    ToDo *newTodo = [[ToDo alloc] initWithContext:appDel.persistentContainer.viewContext];
    newTodo.title = self.titleTxtField.text;
    newTodo.todoDescription = self.descriptionTxtField.text;
    newTodo.priority = [self.priorityTxtField.text intValue];
    
    [appDel saveContext];

    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)defaultsPressed:(UIButton *)sender {
    
    self.titleTxtField.text = [self.defaults stringForKey:@"TodoTitle"];
    self.descriptionTxtField.text = [self.defaults stringForKey:@"TodoDesc"];
    self.priorityTxtField.text = [self.defaults stringForKey:@"Priority"];
}


@end
