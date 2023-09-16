<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class NotificationsTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_notifications_page_contains_empty_data(): void
    {
        $response = $this->get('tasker/notifications');
        $response->assertStatus(200);
        $response->assertSee(__('No Notifications Yet'));
    }
    public function test_notifications_page_contains_non_empty_data(): void
    {
        $response = $this->get('tasker/notifications');
        $response->assertStatus(200);
        $response->assertDontSee(__('No Notifications Yet'));
    }
}
