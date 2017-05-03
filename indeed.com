package com.indeed.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class IndeedJobSearch {

	public static void main(String[] args) throws InterruptedException {
		// Create firefox driver to drive the browser
		WebDriver driver = new FirefoxDriver();
		//open indeed.com homepage
		driver.get("http://www.indeed.com");
		//find what field and enter selenium
		Thread.sleep(2000);
		driver.findElement(By.id("what")).sendKeys("Selenium");
		//find location field and enter city
		Thread.sleep(2000);
		driver.findElement(By.id("where")).clear();
		Thread.sleep(2000);
		driver.findElement(By.id("where")).sendKeys("Fredericksburg");
		//find FindJobs button and click on it
		Thread.sleep(2000);
		driver.findElement(By.id("fj")).click();
		//from job search results page, get page title and jobs count message
		
		
		System.out.println(driver.getTitle());
		System.out.println(driver.findElement(By.id("searchCount")).getText());

	}

}
