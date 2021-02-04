function [age_tValue,age_pValue,age_beta,model_type] = mixed_model(prediction,Covariance_path)
% =========================================================================
% This function is used to examine the age effects on the measures of interest
% Syntax: [age_tValue, age_pValue, age_beta, model_type] = mixed_model(prediction,Covariance_path)
% Input:
%       prediction: Dependent variable in terms of column
%       Covariance_path: Full path of the data containing the covariance infomation
% Output:
%       age_tValue: t value of age effect
%       age_pValue: p value of age effect
%       age_beta: beta value of age effect
%       model_type: type of the optimal model
%                   1 represents linear model
%                   2 represents quadratic model
%
% Written by Tianyuan Lei, SKLCNL, BNU, Beijing, 2020/3/10, tianyuanlei@yeah.net
% =========================================================================
addpath(Covariance_path);
load('info_child.mat');

table_model.depen_var = prediction;

% Inside the parentheses is the random effect
lme1 = fitlme(table_model,'depen_var ~ 1 + age + sex+ meanFD + (1|subname) + (-1 + age|subname)');
lme2 = fitlme(table_model,'depen_var ~ 1 + age^2 + sex + meanFD + (1|subname) + (-1 + age|subname) + (-1 - age + age^2|subname) ');

if lme2.Coefficients.pValue(5)<0.05
    % Model  selection acoording to AIC
    if  lme2.ModelCriterion.AIC > lme1.ModelCriterion.AIC
        model_type = 1;
        age_pValue = lme1.Coefficients.pValue(2);
        age_beta = lme1.Coefficients.Estimate(2);
        age_tValue = lme1.Coefficients.tStat(2);
    else
        model_type = 2;
        age_pValue = lme2.Coefficients.pValue(5);    %significance age^2
        age_beta = lme2.Coefficients.Estimate(5);
        age_tValue = lme2.Coefficients.tStat(5);
    end
else
    model_type = 1;
    age_pValue = lme1.Coefficients.pValue(2);
    age_beta = lme1.Coefficients.Estimate(2);
    age_tValue = lme1.Coefficients.tStat(2);
end