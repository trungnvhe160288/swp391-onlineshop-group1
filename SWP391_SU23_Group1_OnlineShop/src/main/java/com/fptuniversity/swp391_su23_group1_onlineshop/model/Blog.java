/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptuniversity.swp391_su23_group1_onlineshop.model;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Blog {
    /**
     * The unique identifier for this blog post.
     */
    private int id;

    /**
     * The title of this blog post.
     */
    private String title;

    /**
     * The author of this blog post.
     */
    private String author;

    /**
     * The date and time that this blog post was published.
     */
    private LocalDateTime publishDateTime;

    /**
     * The content of this blog post.
     */
    private String content;

    /**
     * The category that this blog post belongs to.
     */
    private String category;

    /**
     * The URL of the image associated with this blog post.
     */
    private String imageUrl;

    // Constructor, getters, and setters omitted for brevity
}
