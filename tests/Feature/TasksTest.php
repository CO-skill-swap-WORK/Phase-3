<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TasksTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     */

    public function test_task_page_contains_empty_data(): void
    {
        $response = $this->get('customer/tasks');
        $response->assertStatus(200);
        $response->assertSee(__('No Posts Yet'));
    }
    public function test_task_page_contains_non_empty_data(): void
    {
        $response = $this->get('customer/tasks');
        $response->assertStatus(200);
        $response->assertDontSee(__('No Posts Yet'));
    }
}
