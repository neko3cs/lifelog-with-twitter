import { TestBed } from '@angular/core/testing';

import { TwitterClientService } from './twitter-client.service';

describe('TwitterClientService', () => {
  let service: TwitterClientService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TwitterClientService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });

  it('should be get tweet', () => {
    service.getTweet()
      .subscribe(
        data => console.log(data)
      );
    expect(true).toBe(true);
  })
});
